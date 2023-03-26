
#include <pic14/pic12f683.h>
typedef unsigned int word;
word __at 0x2007 _CONFIG = (WDT_OFF);
Byte const numbers[10]= (0b0000, 0b0001, 0b0010, 0b0011, 0b0100, 0b0101, 0b0110, 0b0111, 0b1000, 0b1001)
void main(void)
{
    TRISIO = 0x00;
    GPIO = 0x00;

}