import threading as t
import socket, errno
import sys
import datetime
import time
import mraa
import math

def systemButton():
	global systemOn
	global shutdown
	global con

	switch = mraa.Gpio(12)
	switch.dir(mraa.DIR_IN)
	switch.mode(mraa.MODE_PULLUP)

	systemLed = mraa.Gpio(2)
	systemLed.dir(mraa.DIR_OUT)

	while not shutdown:
		if (switch.read() == 0 and not systemOn):
			systemOn = True
			try:
				con.send("on")
			except IOError, e:
				if e.errno == errno.EPIPE:
					print "no connection"

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
	global con

	d1 = datetime.datetime.now()
	sec = datetime.timedelta(seconds=1)

	while not shutdown:
		if (systemOn):
			d2 = datetime.datetime.now()
			if d2 - d1 >= sec:
				d1 = datetime.datetime.now()
				timestamp +=1
				
				motorPwm = valueMotor
				
				print "time:"+str(timestamp),
				print "\t\tpwmMotor:"+str(motorPwm),
				print "\t\tsensor:" +str(valueSensor)
				
				try:
					con.send(str(motorPwm))
				except IOError, e:
					if e.errno == errno.EPIPE:
						print "no connection"

		else:
			timestamp = 0

def pwmMotor():
	global systemOn
	global curve
	global valueMotor
	global shutdown
	global curve
	global valueSensor

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
				pond = (1024-valueSensor)/1024.0 +0.3
				if (timestamp >= 0 and timestamp < 30):
					valueMotor = pond*(0.3 * (timestamp/30.0))
				elif (timestamp >= 30 and timestamp < 60):
					valueMotor = pond*0.3
				elif (timestamp >= 60 and timestamp < 90):
					valueMotor = pond*(0.3 + (0.45 * ((timestamp-60)/30.0)))
				elif (timestamp >= 90 and timestamp <= 120):
					valueMotor = pond*0.75
				elif (timestamp >= 120 and timestamp < 180):
					valueMotor = pond*(0.75 - ((timestamp - 120) * (0.75/60.0)))
				else:
					#valueMotor = 0.0
					systemOn = False
					
			elif (curve == 2):
				pond = (1024-valueSensor)/1024.0 +0.3
				if (timestamp >= 0 and timestamp < 180):
					valueMotor = pond*(0.5 + 0.5*math.sin(timestamp*6.28/180.0))
				else:
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
	global socketConnected

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
		socketConnected = True
		while not shutdown:
			#if (systemOn and timestamp != oldtimestamp and not shutdown):
				#try:
					#con.send(str(valueMotor))
				#except IOError, e:
					#if e.errno == errno.EPIPE:
						#print "no connection"

				#oldtimestamp = timestamp
			if not systemOn and socketConnected:
				data = con.recv(1024)
				if str(data) != "":
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
socketConnected = False

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
