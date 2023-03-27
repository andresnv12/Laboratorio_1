
#include <12f683.h>
#include <stdbool.h>
 

typedef unsigned int word;
// word __at 0x2007 _CONFIG = (WDT_OFF);
int numeros[10]= (0b0000, 0b0001, 0b0010, 0b0011, 0b0100, 0b0101, 0b0110, 0b0111, 0b1000, 0b1001);
int guardados[16] = (0);
int n = 0;
int NumDisplay = 0;
void pantallas();
void RetenerPantalla();
void Guardar();
void main(void)
{
    TRISIO = 0x00;
    GPIO = 0x00;
    int GPIO3;
    while (true)
    {
        NumDisplay = 0; //Se encarga de volver el contador a cero para reiniciar la cuenta
        while(NumDisplay < 100)
        {
            RetenerPantalla();
            if (GPIO3 = 1)
            {
                Guardar();
            }
            NumDisplay++;
        }
    }
}
void pantallas()
{
    int unidades, decenas;
    unidades = NumDisplay % 10;
    decenas = NumDisplay / 10;

    int GPIO = numeros[unidades];
    int GPIO5 = 0x00;
    
    GPIO = numeros[decenas];
    GPIO5 = 0x01;
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
    if (n < 16)
    {
        int repetido = false;
        int i;
        for (i=0;i<16;i++)
        {
            if (NumDisplay = guardados[i])
            {
                repetido = true;
            } 
        }
        if (repetido = false)
        {
            NumDisplay = guardados[n];
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

