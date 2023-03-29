#include <pic14/pic12f683.h>
 
typedef unsigned int word;
word __at 0x2007 __CONFIG = (_WDT_OFF & _MCLRE_OFF);
unsigned const numeros[10]= {0b11000000, 0b11000001, 0b11000010, 0b11000011, 0b11000100, 0b11000101, 0b11000110, 0b11000111, 0b11010000, 0b11010001};
unsigned int guardados[5] = {0};
unsigned int n = 0;
unsigned int NumDisplay;
void pantallas();
void RetenerPantalla();
void Guardar();
void delay(unsigned int tiempo);
void main(void)
{
    TRISIO = 0b00001000;
    //ANSEL = 0b00001000; //todas los pines como salida
    GPIO = 0b00000000; //todos los pines en cero
    while (1)
    {
        NumDisplay = 0; //Se encarga de volver el contador a cero para reiniciar la cuenta
        while(NumDisplay < 100) 
        {
            pantallas();
           
            NumDisplay++; //contador y numero que se debe mostrar en pantalla
        }
    }
}
void pantallas() // Define los valores que se mostraran en la pantalla.
{
    int unidades, decenas;
    
    for( decenas=0; decenas <10; decenas ++)
        for( unidades=0; unidades <10; unidades ++)
            for(int i=0;i<40; i++)
            {
                GP5 = 1;
                delay(1);
                GPIO = (numeros[unidades]);
                
                delay(1);
                GP5 = 0;    
                GPIO = (numeros[decenas]);
                
                
            }
            
}

void RetenerPantalla() //Realiza una accion similar a delay. Se encarga de mantener los valores en pantalla
{
    int tiemporest = 1000;
    while (tiemporest>0)
    {
        pantallas();
         if (GP3 = 0)
            {
               // Guardar();
                
            }
        tiemporest--;
        
    }
}

/*void Guardar() //Se encarga de verificar si NumDisplay es igual a un numero guardado cuando se pulsa el boton.
{
    int repetido = 0;
    int i;
    
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
    
    if (n>=16)
    {
        n = 0;
        NumDisplay = 99;
        RetenerPantalla();
        main();

    }
      
}*/

void delay(unsigned int tiempo) //Se crea un tiempo de espera
{
    unsigned int i ;
    unsigned int j ;

    for( i=0; i <tiempo; i ++)
        for( j =0; j <1000; j ++);
}

