
#include <pic14/pic12f683.h>
typedef unsigned int word;
word __at 0x2007 _CONFIG = (WDT_OFF);
Byte const numeros[10]= (0b0000, 0b0001, 0b0010, 0b0011, 0b0100, 0b0101, 0b0110, 0b0111, 0b1000, 0b1001)
Byte const guardados[16] = ()
int n = 0;
void main(void)
{
    TRISIO = 0x00;
    GPIO = 0x00;
    NumDisplay = 0;
    while (True)
    {
        NumDisplay = 0; //Se encarga de volver el contador a cero para reiniciar la cuenta
        While(NumDisplay < 100)
        {
            RetenerPantalla();
            NumDisplay++;
        }
    }

}

void pantallas()
{
    int unidades, decenas;
    unidades = NumDisplay % 10;
    decenas = NumDisplay / 10;

    GPIO = numeros[unidades];
    GPIO5 = 0;
    DELAY_MS(1);

    GPIO = numeros[decenas];
    GPIO5 = 1;
    DELAY_MS(1);
}

void RetenerPantalla()
{
    int tiemporest = 500;
    while (tiemporest>0)
    {
        pantallas();
        tiemporest--;
        if (GPIO3 = 1)
        {
            Guardar()
        }
    }
}

void Guardar()
{
    if (n < 16)
    {
        int repetido = FALSE;
        for (i=0;i<16;i++)
        {
            if (NumDisplay = guardados[i])
            {
                repetido = TRUE;
            } 
        }
        if (repetido = FALSE)
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