# 1 "Adafruit_INA260.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files/Microchip/MPLABX/v5.50/packs/Microchip/PIC18F-K_DFP/1.4.87/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "Adafruit_INA260.c" 2
# 37 "Adafruit_INA260.c"
# 1 "./Adafruit_INA260.h" 1
# 40 "./Adafruit_INA260.h"
typedef enum _mode {
  INA260_MODE_SHUTDOWN = 0x00,


  INA260_MODE_TRIGGERED = 0x03,


  INA260_MODE_CONTINUOUS = 0x07,


} INA260_MeasurementMode;






typedef enum _conversion_time {
  INA260_TIME_140_us,
  INA260_TIME_204_us,
  INA260_TIME_332_us,
  INA260_TIME_558_us,
  INA260_TIME_1_1_ms,
  INA260_TIME_2_116_ms,
  INA260_TIME_4_156_ms,
  INA260_TIME_8_244_ms,
} INA260_ConversionTime;






typedef enum _count {
  INA260_COUNT_1,
  INA260_COUNT_4,
  INA260_COUNT_16,
  INA260_COUNT_64,
  INA260_COUNT_128,
  INA260_COUNT_256,
  INA260_COUNT_512,
  INA260_COUNT_1024,
} INA260_AveragingCount;






typedef enum _alert_type {
  INA260_ALERT_CONVERSION_READY = 0x1,
  INA260_ALERT_OVERPOWER = 0x2,
  INA260_ALERT_UNDERVOLTAGE = 0x4,
  INA260_ALERT_OVERVOLTAGE = 0x8,
  INA260_ALERT_UNDERCURRENT = 0x10,
  INA260_ALERT_OVERCURRENT = 0x20,
  INA260_ALERT_NONE = 0x0,
} INA260_AlertType;






typedef enum _alert_polarity {
  INA260_ALERT_POLARITY_NORMAL = 0x0,
  INA260_ALERT_POLARITY_INVERTED = 0x1,
} INA260_AlertPolarity;






typedef enum _alert_latch {
  INA260_ALERT_LATCH_ENABLED = 0x1,

  INA260_ALERT_LATCH_TRANSPARENT = 0x0,

} INA260_AlertLatch;






int i2c_address = 0x40;

  void Adafruit_INA260_reset(void);
  float Adafruit_INA260_readCurrent(void);
  float Adafruit_INA260_readBusVoltage(void);
  float Adafruit_INA260_readPower(void);
  void Adafruit_INA260_setMode(INA260_MeasurementMode new_mode);
  INA260_MeasurementMode Adafruit_INA260_getMode;

  int Adafruit_INA260_conversionReady(void);
  int alertFunctionFlag(void);

  typedef enum
{
    I2C_Write,
    I2C_Read,
    Spi,
} dtMSSPTYPE;

typedef enum
{
    WriteSlaveAddress,
            SendAddress,
            SendData,
            Restart,
            SendRxSlaveAdd,
            SetReceiveMode,
            ReadData,
            SendStop,
            Fnished,

} dtMSSPState;
# 167 "./Adafruit_INA260.h"
  INA260_ConversionTime Adafruit_INA260_getCurrentConversionTime(void);
  void Adafruit_INA260_setCurrentConversionTime(INA260_ConversionTime time);
  INA260_ConversionTime Adafruit_INA260_getVoltageConversionTime(void);
  void Adafruit_INA260_setVoltageConversionTime(INA260_ConversionTime time);
  void Adafruit_INA260_setAveragingCount(INA260_AveragingCount count);
  void Adafruit_INA260_setAveragingCount(INA260_AveragingCount count);
# 38 "Adafruit_INA260.c" 2
# 1 "./mcc_generated_files/i2c_master.h" 1
# 54 "./mcc_generated_files/i2c_master.h"
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdio.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\musl_xc8.h" 1 3
# 4 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdio.h" 2 3






# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\features.h" 1 3
# 10 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdio.h" 2 3
# 24 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdio.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 1 3





typedef void * va_list[1];




typedef void * __isoc_va_list[1];
# 122 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned size_t;
# 137 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long ssize_t;
# 168 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef __int24 int24_t;
# 204 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef __uint24 uint24_t;
# 246 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long long off_t;
# 399 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef struct _IO_FILE FILE;
# 24 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdio.h" 2 3
# 52 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdio.h" 3
typedef union _G_fpos64_t {
 char __opaque[16];
 double __align;
} fpos_t;

extern FILE *const stdin;
extern FILE *const stdout;
extern FILE *const stderr;





FILE *fopen(const char *restrict, const char *restrict);
FILE *freopen(const char *restrict, const char *restrict, FILE *restrict);
int fclose(FILE *);

int remove(const char *);
int rename(const char *, const char *);

int feof(FILE *);
int ferror(FILE *);
int fflush(FILE *);
void clearerr(FILE *);

int fseek(FILE *, long, int);
long ftell(FILE *);
void rewind(FILE *);

int fgetpos(FILE *restrict, fpos_t *restrict);
int fsetpos(FILE *, const fpos_t *);

size_t fread(void *restrict, size_t, size_t, FILE *restrict);
size_t fwrite(const void *restrict, size_t, size_t, FILE *restrict);

int fgetc(FILE *);
int getc(FILE *);
int getchar(void);
int ungetc(int, FILE *);

int fputc(int, FILE *);
int putc(int, FILE *);
int putchar(int);

char *fgets(char *restrict, int, FILE *restrict);

char *gets(char *);


int fputs(const char *restrict, FILE *restrict);
int puts(const char *);

#pragma printf_check(printf) const
#pragma printf_check(vprintf) const
#pragma printf_check(sprintf) const
#pragma printf_check(snprintf) const
#pragma printf_check(vsprintf) const
#pragma printf_check(vsnprintf) const

int printf(const char *restrict, ...);
int fprintf(FILE *restrict, const char *restrict, ...);
int sprintf(char *restrict, const char *restrict, ...);
int snprintf(char *restrict, size_t, const char *restrict, ...);

int vprintf(const char *restrict, __isoc_va_list);
int vfprintf(FILE *restrict, const char *restrict, __isoc_va_list);
int vsprintf(char *restrict, const char *restrict, __isoc_va_list);
int vsnprintf(char *restrict, size_t, const char *restrict, __isoc_va_list);

int scanf(const char *restrict, ...);
int fscanf(FILE *restrict, const char *restrict, ...);
int sscanf(const char *restrict, const char *restrict, ...);
int vscanf(const char *restrict, __isoc_va_list);
int vfscanf(FILE *restrict, const char *restrict, __isoc_va_list);
int vsscanf(const char *restrict, const char *restrict, __isoc_va_list);

void perror(const char *);

int setvbuf(FILE *restrict, char *restrict, int, size_t);
void setbuf(FILE *restrict, char *restrict);

char *tmpnam(char *);
FILE *tmpfile(void);




FILE *fmemopen(void *restrict, size_t, const char *restrict);
FILE *open_memstream(char **, size_t *);
FILE *fdopen(int, const char *);
FILE *popen(const char *, const char *);
int pclose(FILE *);
int fileno(FILE *);
int fseeko(FILE *, off_t, int);
off_t ftello(FILE *);
int dprintf(int, const char *restrict, ...);
int vdprintf(int, const char *restrict, __isoc_va_list);
void flockfile(FILE *);
int ftrylockfile(FILE *);
void funlockfile(FILE *);
int getc_unlocked(FILE *);
int getchar_unlocked(void);
int putc_unlocked(int, FILE *);
int putchar_unlocked(int);
ssize_t getdelim(char **restrict, size_t *restrict, int, FILE *restrict);
ssize_t getline(char **restrict, size_t *restrict, FILE *restrict);
int renameat(int, const char *, int, const char *);
char *ctermid(char *);







char *tempnam(const char *, const char *);
# 54 "./mcc_generated_files/i2c_master.h" 2

# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdint.h" 1 3
# 22 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdint.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 127 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long uintptr_t;
# 142 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long intptr_t;
# 158 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef signed char int8_t;




typedef short int16_t;
# 173 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long int32_t;





typedef long long int64_t;
# 188 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long long intmax_t;





typedef unsigned char uint8_t;




typedef unsigned short uint16_t;
# 209 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long uint32_t;





typedef unsigned long long uint64_t;
# 229 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long long uintmax_t;
# 22 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdint.h" 2 3


typedef int8_t int_fast8_t;

typedef int64_t int_fast64_t;


typedef int8_t int_least8_t;
typedef int16_t int_least16_t;

typedef int24_t int_least24_t;
typedef int24_t int_fast24_t;

typedef int32_t int_least32_t;

typedef int64_t int_least64_t;


typedef uint8_t uint_fast8_t;

typedef uint64_t uint_fast64_t;


typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;

typedef uint24_t uint_least24_t;
typedef uint24_t uint_fast24_t;

typedef uint32_t uint_least32_t;

typedef uint64_t uint_least64_t;
# 144 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdint.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\bits/stdint.h" 1 3
typedef int16_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef uint16_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
# 144 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdint.h" 2 3
# 55 "./mcc_generated_files/i2c_master.h" 2

# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c99\\stdbool.h" 1 3
# 56 "./mcc_generated_files/i2c_master.h" 2


typedef enum {
    I2C_NOERR,
    I2C_BUSY,
    I2C_FAIL


} i2c_error_t;

typedef enum
{
    I2C_RESTART_READ,
    I2C_RESTART_WRITE,
    I2C_CONTINUE,
    I2C_RESET_LINK
} i2c_operations_t;

typedef enum {
    I2C_IDLE = 0,
    I2C_SEND_ADR_READ,
    I2C_SEND_ADR_WRITE,
    I2C_TX,
    I2C_RX,
    I2C_RCEN,
    I2C_TX_EMPTY,
    I2C_SEND_RESTART_READ,
    I2C_SEND_RESTART_WRITE,
    I2C_SEND_RESTART,
    I2C_SEND_STOP,
    I2C_RX_ACK,
    I2C_RX_NACK_STOP,
    I2C_RX_NACK_RESTART,
    I2C_RESET,
    I2C_ADDRESS_NACK,

} i2c_fsm_states_t;


typedef uint8_t i2c_address_t;
typedef i2c_operations_t (*i2c_callback_t)(void *funPtr);


i2c_operations_t I2C_CallbackReturnStop(void *funPtr);
i2c_operations_t I2C_CallbackReturnReset(void *funPtr);
i2c_operations_t I2C_CallbackRestartWrite(void *funPtr);
i2c_operations_t I2C_CallbackRestartRead(void *funPtr);

void BUS_REGISTER(i2c_fsm_states_t i2cdevice, int reg_addr, int witdh, int byteorder);





void I2C_Initialize(void);
# 122 "./mcc_generated_files/i2c_master.h"
i2c_error_t I2C_Open(i2c_address_t address);
# 132 "./mcc_generated_files/i2c_master.h"
i2c_error_t I2C_Close(void);
# 144 "./mcc_generated_files/i2c_master.h"
i2c_error_t I2C_MasterOperation(_Bool read);




i2c_error_t I2C_MasterWrite(void);




i2c_error_t I2C_MasterRead(void);
# 163 "./mcc_generated_files/i2c_master.h"
void I2C_SetTimeout(uint8_t timeOut);
# 173 "./mcc_generated_files/i2c_master.h"
void I2C_SetBuffer(void *buffer, size_t bufferSize);
# 185 "./mcc_generated_files/i2c_master.h"
void I2C_SetDataCompleteCallback(i2c_callback_t cb, void *ptr);
# 195 "./mcc_generated_files/i2c_master.h"
void I2C_SetWriteCollisionCallback(i2c_callback_t cb, void *ptr);
# 205 "./mcc_generated_files/i2c_master.h"
void I2C_SetAddressNackCallback(i2c_callback_t cb, void *ptr);
# 215 "./mcc_generated_files/i2c_master.h"
void I2C_SetDataNackCallback(i2c_callback_t cb, void *ptr);
# 225 "./mcc_generated_files/i2c_master.h"
void I2C_SetTimeoutCallback(i2c_callback_t cb, void *ptr);
# 39 "Adafruit_INA260.c" 2
# 102 "Adafruit_INA260.c"
float Adafruit_INA260_readBusVoltage(void) {
  I2C_Open(0x40);
  BUS_REGISTER(I2C_SEND_ADR_READ, 0x02, 2, 1);
  return I2C_MasterOperation(1) * 1.25;
}
