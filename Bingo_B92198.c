#include <pic14/pic12f683.h>
 
typedef unsigned int word;
//word __at 0x2007 __CONFIG = (_WDT_OFF);
unsigned short numeros[10]= {0b0000, 0b0001, 0b0010, 0b0011, 0b0100, 0b0101, 0b0110, 0b0111, 0b1000, 0b1001};
unsigned short guardados[5] = {0};
unsigned int n = 0;
unsigned int NumDisplay = 0;
void pantallas();
void RetenerPantalla();
void Guardar();

void main(void)
{
    ANSEL = 0b00000010;
    TRISIO = 0b00000000; //todas los pines como salida
    GPIO = 0b00000000; //todos los pines en cero
    while (1)
    {
        NumDisplay = 0; //Se encarga de volver el contador a cero para reiniciar la cuenta
        while(NumDisplay < 100) 
        {
            RetenerPantalla();
            if (GP3 = 0x01)
            {
                Guardar();
                GP3 = ~GP3;
            }
            NumDisplay++; //contador y numero que se debe mostrar en pantalla
        }
    }
}
void pantallas()
{
    int unidades, decenas;
    unidades = NumDisplay % 10;
    decenas = NumDisplay / 10;
    GP5 = 0;
    GPIO = numeros[unidades];

    
    GP5 = 1;
    GPIO = numeros[decenas];
    
}

void RetenerPantalla()
{
    int tiemporest = 500;
    while (tiemporest>0)
    {
        pantallas();
        tiemporest--;
        
    }
}

void Guardar()
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

