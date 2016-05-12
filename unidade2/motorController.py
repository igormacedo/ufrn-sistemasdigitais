import threading as t
import socket, errno
import sys
import datetime
import time
import mraa

def systemButton():
	global systemOn
	global shutdown

	switch = mraa.Gpio(12)
	switch.dir(mraa.DIR_IN)
	switch.mode(mraa.MODE_PULLUP)

	systemLed = mraa.Gpio(2)
	systemLed.dir(mraa.DIR_OUT)

	while not shutdown:
		if (switch.read() == 0):
			systemOn = True

		if systemOn:
			systemLed.write(1)
		else:
			systemLed.write(0)

	systemLed.write(0)

def timer():
	global timestamp
	global systemOn
	global valueMotor
	global valueSensor
	global shutdown

	d1 = datetime.datetime.now()
	sec = datetime.timedelta(seconds=1)

	while not shutdown:
		if (systemOn):
			d2 = datetime.datetime.now()
			if d2 - d1 >= sec:
				d1 = datetime.datetime.now()
				timestamp +=1
				print "time:"+str(timestamp),
				print "\t\tpwmMotor:"+str(valueMotor),
				print "\t\tsensor:" +str(valueSensor)
		else:
			timestamp = 0

def pwmMotor():
	global systemOn
	global curve
	global valueMotor
	global shutdown
	global curve

	motor = mraa.Pwm(11)
	motor.period_us(5000)
	motor.enable(True)
	valueMotor = 0.0
	oldValueMotor = 0.0
	motor.write(valueMotor)

	motorLed = mraa.Pwm(5)
	motorLed.period_us(5000)
	motorLed.enable(True)


	while not shutdown:
		if (systemOn):
			if (curve == 1):
				if (timestamp >= 0 and timestamp < 30):
					valueMotor = (0.3 * (timestamp/30.0))
				elif (timestamp >= 30 and timestamp < 60):
					valueMotor = 0.3
				elif (timestamp >= 60 and timestamp < 90):
					valueMotor = 0.3 + (0.45 * ((timestamp-60)/30.0))
				elif (timestamp >= 90 and timestamp <= 120):
					valueMotor = 0.75
				elif (timestamp >= 120 and timestamp < 180):
					valueMotor = (0.75 - ((timestamp - 120) * (0.75/60.0)))
				else:
					#valueMotor = 0.0
					systemOn = False

			if oldValueMotor != valueMotor:
				motor.write(valueMotor)
				motorLed.write(valueMotor)
				oldValueMotor = valueMotor

		else:
			motor.write(0.0)
			motorLed.write(0.0)

	motor.write(0.0)
	motorLed.write(0.0)

def sensorRead():
	global valueSensor
	global shutdown
	global valueMotor

	sensorLed = mraa.Pwm(6)
	sensorLed.period_us(5000)
	sensorLed.enable(True)
	valueSensorLed = 0.0

	while not shutdown:
		if (systemOn):
			sensor = mraa.Aio(0)
			valueSensor = sensor.read()
			valueSensorLed = valueSensor/1024.0
			sensorLed.write(valueSensorLed)
		else:
			sensorLed.write(0.0)

	sensorLed.write(0.0)

def sockettcp():
	global timestamp
	global systemOn
	global con
	global valueMotor
	global curve

	oldtimestamp = -1

	tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	orig = ("",8888)
	tcp.bind(orig)
	tcp.listen(1)
	print "Socket created and listening"


	while not shutdown:
		con, cliente = tcp.accept()
		print "Connection accepted from: " + str(cliente)
		data = con.recv(1024)
		print "Message from client: " + str(data)
		while not shutdown:
			if (systemOn and timestamp != oldtimestamp and not shutdown):
				try:
					con.send(str(valueMotor))
				except IOError, e:
					if e.errno == errno.EPIPE:
						print "Connection lost"

				oldtimestamp = timestamp
			elif not systemOn:
				data = con.recv(1024)
				print "Received: " + str(data)

				if data == "a":
					systemOn = True
					curve = 1
				elif data =="b":
					systemOn = True
					curve = 2


#Variaveis Globais
timestamp = 0 # mede a passagem do tempo em segundos
systemOn = False # indica se o sistema esta ativo ou nao
curve = 1
valueMotor = 0
shutdown = False
valueSensor = 0
con = None
curve = 1

# ledSys = mraa.Gpio(4)
# ledSys.dir(mraa.DIR_OUT)
# ledSys.write(0)

x = mraa.Pwm(11)
x.period_us(5000)
x.enable(False)
x.write(0.0)

# criamos um vetor de threads
my_threads = []
# criamos as threads
my_threads.append(t.Thread(target=systemButton, name="systemButtonThread"))
my_threads.append(t.Thread(target=timer, name="TimerThread"))
my_threads.append(t.Thread(target=pwmMotor, name="pwmMotorThread"))
my_threads.append(t.Thread(target=sensorRead, name="sensorReadThread"))
my_threads.append(t.Thread(target=sockettcp, name="socketThread"))


# comecamos as threads
for thread in my_threads:
	thread.start()

try:
	while True:
		time.sleep(1)
except KeyboardInterrupt:
	shutdown = True
	con.close()
	print "Ctrl-c pressed ..."
	sys.exit(1)
