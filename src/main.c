
#pragma config WRT0 = OFF       // Write Protection bit (Block 0 (000800-001FFFh) is not write-protected)
#pragma config WRT1 = OFF       // Write Protection bit (Block 1 (002000-003FFFh) is not write-protected)
#pragma config WRT2 = OFF       // Write Protection bit (Block 2 (004000-005FFFh) is not write-protected)
#pragma config WRT3 = OFF       // Write Protection bit (Block 3 (006000-007FFFh) is not write-protected)
#pragma config WRTC = OFF       // Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) are not write-protected)
#pragma config WRTB = OFF       // Boot Block Write Protection bit (Boot block (000000-0007FFh) is not write-protected)
#pragma config WRTD = OFF       // Data EEPROM Write Protection bit (Data EEPROM is not write-protected)

#include "Interrupts.h"
#include "MSSP.h"
#include "TIMER0.h"
#include "Control.h"

uint8 GetTick(void);
uint8 TickEllapsed(uint8 TimeStamp, uint8 Timeout);

uint8 Ticks;
void Ticker(void)
{
    Ticks++;
}
uint8 GetTick(void)
{
    return Ticks;
}

uint8 TickEllapsed(uint8 TimeStamp, uint8 Timeout)
{
    uint8 ret = 0;
    if((uint8)(Ticks-TimeStamp) >= Timeout) ret = 1;
    return ret;
}

void HAL_Init(void)
{
    *((uint8*)0xFF1) &= 0x7F;

   Interrupt_Init();
    
}

void main(void) 
{
    HAL_Init();
    TIMER0_Set(T0_ENABLE|T0_16BIT|T0_CLK_IN|T0_PRESC_1, 11999, Ticker);
    while(GetTick() < 150);
    
    
    
    Control_Init();

    while(1)
    {
        Control_Task();
    }
    return;
}
