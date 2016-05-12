#include <sys/types.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>
 
#define BAUDRATE 9600
#define BAUD_PRESCALLER (((F_CPU / (BAUDRATE * 16UL))) - 1)

// Funções USART
void USART_init(void);
unsigned char USART_receive(void);
void USART_send( unsigned char data);
void USART_putstring(char* StringPtr);

// Contador de overflows
volatile int overflow_count;

// Valor do sensor após converção AD
volatile int sensor_convertido = 0;

// Indica que a execução deve ser iniciada
unsigned char ativar;

// Função INTERRUPT SERVICE ROUTINE
ISR(TIMER1_OVF_vect){

  overflow_count++;
  
  int16_t comp = 0;

  if (ativar == 'a'){
    if (overflow_count <= 240  ){ //0 a 30 segundos
      comp = ((1024 - 0.15*sensor_convertido)/1024.0) * (307 * (overflow_count/240.0));
    }else if (overflow_count > 240 && overflow_count <= 480  ){ //30 a 60 segundos
      comp = ((1024 - 0.15*sensor_convertido)/1024.0) * 307;
    }else if (overflow_count > 480 && overflow_count <= 720  ){ //60 a 90 segundos
      comp = ((1024 - 0.15*sensor_convertido)/1024.0) * (307 + ((overflow_count - 480.0) * (461.0/(720-480))));
    }else if (overflow_count > 720 && overflow_count <= 960  ){ //90 a 120 segundos
      comp = ((1024 - 0.15*sensor_convertido)/1024.0) * 768;
    }else if (overflow_count > 960 && overflow_count <= 1440  ){ //0 a 30 segundos
      comp = ((1024 - 0.15*sensor_convertido)/1024.0) * (768 - ((overflow_count - 960.0) * (768.0/(1440-960)))); 
    }else if (overflow_count > 1440){
      comp = 0;
    }
  }else{
    if (overflow_count <= 240  ){ //0 a 30 segundos
      comp = ((1024 - 0.15*sensor_convertido)/1024.0) * 200;;
    }else if (overflow_count > 240 && overflow_count <= 480  ){ //30 a 60 segundos
      comp = ((1024 - 0.15*sensor_convertido)/1024.0) * 307;
    }else if (overflow_count > 480 && overflow_count <= 720  ){ //60 a 90 segundos
      comp = ((1024 - 0.15*sensor_convertido)/1024.0) * 480;
    }else if (overflow_count > 720 && overflow_count <= 960  ){ //90 a 120 segundos
      comp = ((1024 - 0.15*sensor_convertido)/1024.0) * 768;
    }else if (overflow_count > 960 && overflow_count <= 1440  ){ //0 a 30 segundos
      comp = ((1024 - 0.15*sensor_convertido)/1024.0) * (768 - ((overflow_count - 960.0) * (768.0/(1440-960)))); 
    }else if (overflow_count > 1440){
      comp = 0;
    }
  }
  
  OCR1A = comp;
  OCR0A = 255*(comp/1024.0);;
  OCR0B = 255*((1024 - sensor_convertido)/1024.0);
  
  int temp = OCR1A;
  
  unsigned char senda, v = ',';
  
  itoa(temp, &senda, 10);
  USART_send(senda);
  USART_send(v);
 
}



int main(void)
{

    // Define porta D7 como entrada (para botao)
    DDRD = 0b00000000;
    // Seta modo Pull-Up na porta PORTD7 (esse modo é definido quando a porta é de leitura e é setado valor 1)
    PORTD = 0b10000000;

    // Inicia USART para envio e recebimento de informações
    USART_init();        

    // Desativa interrupções globais
    cli();

    // Define porta B5 como saída
    DDRB = 0B00100000;
    PORTB = 0x00;
    
    /* CONVERSOR AD */
    ADMUX |= 0b01000101; // set voltagem de referencia
    DDRB |= 0b00101111; // PB5 
    ADCSRA |= 0b10000111;
    /* FIM CONVERSOR AD */

    
    //Set Fast PWM 10 bit
    //Clear OC1A/OC1B on Compare Match, set OC1A/OC1B at BOTTOM (non-inverting mode)
    TCCR1A |= 0b10100011;
    //Set prescaler to 1024
    //Set fast PWM 10bit
    TCCR1B |= 0b00000101; 
    // Motor Desligado
    OCR1A = 0;

    DDRD |= (1 << DDD6);
    // PD6 is now an output
    OCR0A = 0;
    // set PWM for 50% duty cycle
    TCCR0A |= (1 << COM0A1);
    // set none-inverting mode
    TCCR0A |= (1 << WGM01) | (1 << WGM00);
    // set fast PWM Mode
    //TCCR0B |= (1 << CS01);
    // set prescaler to 8 and starts PWM

    DDRD |= (1 << DDD5);
    // PD6 is now an output
    OCR0B = 0;
    // set PWM for 50% duty cycle
    TCCR0A |= (1 << COM0B1);
    // set none-inverting mode
    TCCR0A |= (1 << WGM01) | (1 << WGM00);
    // set fast PWM Mode
    //TCCR0B |= (1 << CS01);
    // set prescaler to 8 and starts PWM
     
    
    while(true){
      ativar = USART_receive();
      
      if(ativar){
        PORTB = 0b00100000;
      }else
      { 
        PORTB = 0b00000000;
      }
      
      if((PIND & 0b10000000) == 0 || ativar == 'a' || ativar == 'b'){
        DDRD |= (1 << DDD6)|(1 << DDD5)|(1 << DDD3);
        PORTD |= 0b000001000;
        TCCR0B |= (1 << CS01);
        
        TIMSK1 = 0b00000001; // enable Timer 1 overflow interrupt
        sei();
        
        ADMUX |= 0b00000101; // set adc5
        while(1){
            ADCSRA |= 0b01000000; //inicia a conversao
            while(!(ADCSRA & 0b00010000)); // Indica uma conversão finalizada
            sensor_convertido = ADC;
            if(overflow_count > 1440){
              cli();
              overflow_count = 0;
              TCCR0B &= ~(1 << CS01);
              PORTD &= ~(0b000001000);
              DDRD = 0;
              break;
            }
        }
      }   
    }
    return 0;
}

void USART_init(void){
 UBRR0H = (uint8_t)(BAUD_PRESCALLER>>8);
 UBRR0L = (uint8_t)(BAUD_PRESCALLER);
 UCSR0B = (1<<RXEN0)|(1<<TXEN0);
 UCSR0C = (3<<UCSZ00);
}
 
unsigned char USART_receive(void){
   return UDR0;
}
 
void USART_send( unsigned char data){
 while(!(UCSR0A & (1<<UDRE0)));
 UDR0 = data;
 
}
 
void USART_putstring(char* StringPtr){
  while(*StringPtr != 0x00){
   USART_send(*StringPtr);
   StringPtr++;
  }
}

