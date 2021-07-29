
#ifndef INA260_DRIVER_TYPES_H
#define	INA260_DRIVER_TYPES_H

#include "types.h"

typedef enum
{
    INA260_InitAlertMask,
            INA260_InitConfig,
            INA260_WaitForConfigWrite,
            INA260_WatchAlert,
            INA260_ReadAlertWait,
            INA260_StartReadCurrent,
            INA260_WaitForReadCurrent,
            INA260_StartReadVoltage,
            INA260_WaitForReadVoltage,
            INA260_StartReadPower,
            INA260_WaitForReadPower,
} dtINA260DriverState;

typedef struct
{
    uint8 Inited    :1;
    uint8 NewValue  :1;
} dtStateFlags;

#endif	/* INA260_DRIVER_TYPES_H */

