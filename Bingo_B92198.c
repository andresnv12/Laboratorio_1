#include <pic14/pic12f683.h>
 
typedef unsigned int word;
word __at 0x2007 __CONFIG = (_WDT_OFF & _MCLRE_OFF);
unsigned const char numuni[]= {0b11100000, 
0b11100001, 
0b11100010, 
0b11100011, 
0b11100100, 
0b11100101, 
0b11100110, 
0b11100111, 
0b11110000, 
0b11110001};
unsigned const char numdeci[] = {0b11000000, 
0b11000001, 
0b11000010, 
0b11000011, 
0b11000100, 
0b11000101, 
0b11000110, 
0b11000111, 
0b11010000, 
0b11010001};
unsigned char guardados[16] = {0};
unsigned int n = 0;
unsigned int NumDisplay;
void pantallas();
void Guardar();
void delay(unsigned int tiempo);
int unidades, decenas;
void main(void)

{
    TRISIO = 0b00001000;
    GPIO = 0b00000000; //todos los pines en cero
    while (1)
    {    //Se encarga de volver el contador a cero para reiniciar la cuenta
        for (NumDisplay = 0; NumDisplay < 100; NumDisplay++) 
        {
            pantallas();
            
        }
        if (GP3 = 1)
                {
                    Guardar();
                }  
    }
}
void pantallas() // Define los valores que se mostraran en la pantalla.
{
    
    
    for( decenas=0; decenas <10; decenas ++)
        for( unidades=0; unidades <10; unidades ++)
            for(int i=0;i<4; i++)
            {
                delay(1);
                GPIO = (numdeci[decenas]); 
                delay(1);  
                GPIO = (numuni[unidades]);   
                               
            }
            
}


void Guardar() //Se encarga de verificar si NumDisplay es igual a un numero guardado cuando se pulsa el boton.
{
    int repetido = 0;
    
    for (int i=0;i<16;i++)
    {
        if (NumDisplay = guardados[i])
        {
            repetido = 1;
        } 
    }
    if (repetido = 0)
    {
       for( decenas=0; decenas <10; decenas ++)
        for( unidades=0; unidades <10; unidades ++)
            for(int i=0;i<500; i++)
            {
                delay(1);
                GPIO = 9; 
                delay(1);  
                GPIO = 9;
            }
        n++;
    }
    
    if (n>=16)
    {
        n = 0;
        for( decenas=0; decenas <10; decenas ++)
        for( unidades=0; unidades <10; unidades ++)
            for(int i=0;i<500; i++)
            {
                delay(1);
                GPIO = 9; 
                delay(1);  
                GPIO = 9;
            }
        main();
    }
    
      
}

void delay(unsigned int tiempo) //Se crea un tiempo de espera
{
    unsigned int i ;
    unsigned int j ;

    for( i=0; i <tiempo; i ++)
        for( j =0; j <1300; j ++);
}

