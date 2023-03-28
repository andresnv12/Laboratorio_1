#include <pic14/pic12f683.h>
 
typedef unsigned int word;
word __at 0x2007 __CONFIG = (_WDT_OFF & _MCLRE_OFF);
unsigned short numeros[9]= {0b00000, 0b00001, 0b00010, 0b00011, 0b00100, 0b00101, 0b00110, 0b00111, 0b10000, 0b10001};
unsigned short guardados[5] = {0};
unsigned int n = 0;
unsigned int NumDisplay;
void pantallas();
void RetenerPantalla();
void Guardar();
void delay(unsigned int tiempo);
void main(void)
{
    TRISIO = 0b00000000; //todas los pines como salida
    GPIO = 0b00000000; //todos los pines en cero
    while (1)
    {
        NumDisplay = 0; //Se encarga de volver el contador a cero para reiniciar la cuenta
        while(NumDisplay < 100) 
        {
            RetenerPantalla();
            if (GP3 = 1)
            {
                Guardar();
                
            }
            NumDisplay++; //contador y numero que se debe mostrar en pantalla
            delay(100);
        }
    }
}
void pantallas() // Define los valores que se mostraran en la pantalla.
{
    int unidades, decenas;
    unidades = NumDisplay % 10;
    decenas = NumDisplay / 10;

    GPIO = numeros[unidades];
    delay(1);
    GP5 = 1;
    delay(1);
    GPIO = numeros[decenas];
    GP5 = 0;    
}

void RetenerPantalla() //Realiza una accion similar a delay. Se encarga de mantener los valores en pantalla
{
    int tiemporest = 1000;
    while (tiemporest>0)
    {
        pantallas();
        tiemporest--;
        
    }
}

void Guardar() //Se encarga de verificar si NumDisplay es igual a un numero guardado cuando se pulsa el boton.
{
    int repetido = 0;
    int i;
    if (n < 16)
    {
        
        for (i=0;i<16;i++)
        {
            if (NumDisplay = guardados[i])
            {
                repetido = 1;
            } 
        }
        if (repetido = 0)
        {
            guardados[n] = NumDisplay;
            n++;
            RetenerPantalla();
        }
    }
    else
    {
        n = 0;
        NumDisplay = 98;
    }  
}

void delay(unsigned int tiempo) //Se crea un tiempo de espera
{
    unsigned int i ;
    unsigned int j ;

    for( i=0; i <tiempo; i ++)
        for( j =0; j <1000; j ++);
}

