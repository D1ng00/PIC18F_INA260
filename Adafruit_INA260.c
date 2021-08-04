/*!
 *  @file Adafruit_INA260.cpp
 *
 *  @mainpage Adafruit INA260 I2C Current and Power sensor
 *
 *  @section intro_sec Introduction
 *
 * 	I2C Driver for the INA260 I2C Current and Power sensor
 *
 * 	This is a library for the Adafruit INA260 breakout:
 * 	http://www.adafruit.com/products/4226
 *
 * 	Adafruit invests time and resources providing this open source code,
 *  please support Adafruit and open-source hardware by purchasing products from
 * 	Adafruit!
 *
 *  @section dependencies Dependencies
 *
 *  This library depends on the Adafruit BusIO library
 *
 *  @section author Author
 *
 *  Bryan Siepert for Adafruit Industries
 *
 * 	@section license License
 *
 * 	BSD (see license.txt)
 *
 * 	@section  HISTORY
 *
 *     v1.0 - First release
 */

//#include "Arduino.h"
//#include <Wire.h>

#include "Adafruit_INA260.h"
#include "mcc_generated_files/i2c_master.h"
//static int voltage;
/*!
 *    @brief  Instantiates a new INA260 class
 */

/*!
 *    @brief  Sets up the HW
 *    @param  i2c_address
 *            The I2C address to be used.
 *    @param  theWire
 *            The Wire object to be used for I2C connections.
 *    @return True if initialization was successful, otherwise false.
 */
/*int Adafruit_INA260_begin(uint8_t i2c_address) {
  //i2c_dev = new Adafruit_I2CDevice(i2c_address, theWire);

  /*if (!i2c_dev->begin()) {
    return false;
  }

  Adafruit_I2CRegister *die_register = new Adafruit_I2CRegister(i2c_dev, INA260_REG_DIE_UID, 2, MSBFIRST);
  Adafruit_I2CRegister *mfg_register = new Adafruit_I2CRegister(i2c_dev, INA260_REG_MFG_UID, 2, MSBFIRST);
  Adafruit_I2CRegisterBits *device_id = new Adafruit_I2CRegisterBits(die_register, 12, 4);

  // make sure we're talking to the right chip
  if ((mfg_register->read() != 0x5449) || (device_id->read() != 0x227)) {
    return false;
  }*/

/*  int Config = BUS_REGISTER(I2C_RESET, INA260_REG_CONFIG, 2, 1);
  //int MaskEnable = BUS_REGISTER(i2c_dev, INA260_REG_MASK_ENABLE, 2, 1);
  //int AlertLimit = BUS_REGISTER(i2c_dev, INA260_REG_ALERT_LIMIT, 2, MSBFIRST);

  //reset();
  //delay(2); // delay 2ms to give time for first measurement to finish
  return true;
}*/
/**************************************************************************/
/*!
    @brief Resets the harware. All registers are set to default values,
    the same as a power-on reset.
*/
/**************************************************************************/
/*void Adafruit_INA260_reset(void) {
   Adafruit_I2CRegisterBits(Config, 1, 15);
  reset.write(1);
}
/**************************************************************************/
/*!
    @brief Reads and scales the current value of the Current register.
    @return The current current measurement in mA
*/
/**************************************************************************/
/*float Adafruit_INA260_readCurrent(void) {
  Adafruit_I2CRegister current = Adafruit_I2CRegister(i2c_dev, INA260_REG_CURRENT, 2, MSBFIRST);
  return (int16_t)current.read() * 1.25;
}
/**************************************************************************/
/*!
    @brief Reads and scales the current value of the Bus Voltage register.
    @return The current bus voltage measurement in mV
*/
/**************************************************************************/
float Adafruit_INA260_readBusVoltage(void) {
  I2C_Open(INA260_I2CADDR_DEFAULT);
  BUS_REGISTER(I2C_SEND_ADR_READ, INA260_REG_BUSVOLTAGE, 2, 1);
  return I2C_MasterOperation(true) * 1.25;
}
/**************************************************************************/
/*!
    @brief Reads and scales the current value of the Power register.
    @return The current Power calculation in mW
*/
/**************************************************************************/
/*float Adafruit_INA260_readPower(void) {
  Adafruit_I2CRegister power =
      Adafruit_I2CRegister(i2c_dev, INA260_REG_POWER, 2, MSBFIRST);
  return power.read() * 10;
}
/**************************************************************************/
/*!
    @brief Returns the current measurement mode
    @return The current mode
*/
/**************************************************************************/
/*INA260_MeasurementMode Adafruit_INA260_getMode(void) {
  Adafruit_I2CRegisterBits mode = Adafruit_I2CRegisterBits(Config, 3, 0);
  return (INA260_MeasurementMode)mode.read();
}
/**************************************************************************/
/*!
    @brief Sets a new measurement mode
    @param new_mode
           The new mode to be set
*/
/**************************************************************************/
/*void Adafruit_INA260_setMode(INA260_MeasurementMode new_mode) {
  Adafruit_I2CRegisterBits mode = Adafruit_I2CRegisterBits(Config, 3, 0);
  mode.write(new_mode);
}
/**************************************************************************/
/*!
    @brief Reads the current number of averaging samples
    @return The current number of averaging samples
*/
/**************************************************************************/
/*INA260_AveragingCount Adafruit_INA260_getAveragingCount(void) {
  Adafruit_I2CRegisterBits averaging_count =
      Adafruit_I2CRegisterBits(Config, 3, 9);
  return (INA260_AveragingCount)averaging_count.read();
}
/**************************************************************************/
/*!
    @brief Sets the number of averaging samples
    @param count
           The number of samples to be averaged
*/
/**************************************************************************/
/*void Adafruit_INA260_setAveragingCount(INA260_AveragingCount count) {
  Adafruit_I2CRegisterBits averaging_count =
      Adafruit_I2CRegisterBits(Config, 3, 9);
  averaging_count.write(count);
}
/**************************************************************************/
/*!
    @brief Reads the current current conversion time
    @return The current current conversion time
*/
/**************************************************************************/
/*INA260_ConversionTime Adafruit_INA260_getCurrentConversionTime(void) {
  Adafruit_I2CRegisterBits current_conversion_time =
      Adafruit_I2CRegisterBits(Config, 3, 3);
  return (INA260_ConversionTime)current_conversion_time.read();
}
/**************************************************************************/
/*!
    @brief Sets the current conversion time
    @param time
           The new current conversion time
*/
/**************************************************************************/
/*void Adafruit_INA260_setCurrentConversionTime(INA260_ConversionTime time) {
  Adafruit_I2CRegisterBits current_conversion_time =
      Adafruit_I2CRegisterBits(Config, 3, 3);
  current_conversion_time.write(time);
}
/**************************************************************************/
/*!
    @brief Reads the current bus voltage conversion time
    @return The current bus voltage conversion time
*/
/**************************************************************************/
/*INA260_ConversionTime Adafruit_INA260_getVoltageConversionTime(void) {
  Adafruit_I2CRegisterBits voltage_conversion_time =
      Adafruit_I2CRegisterBits(Config, 3, 6);
  return (INA260_ConversionTime)voltage_conversion_time.read();
}
/**************************************************************************/
/*!
    @brief Sets the bus voltage conversion time
    @param time
           The new bus voltage conversion time
*/
/**************************************************************************/
/*void Adafruit_INA260_setVoltageConversionTime(INA260_ConversionTime time) {
  Adafruit_I2CRegisterBits voltage_conversion_time =
      Adafruit_I2CRegisterBits(Config, 3, 6);
  voltage_conversion_time.write(time);
}

/**************************************************************************/
/*!
    @brief Checks if the most recent one shot measurement has completed
    @return true if the conversion has completed
*/
/**************************************************************************/
/*int Adafruit_INA260_conversionReady(void) {
  Adafruit_I2CRegisterBits conversion_ready =
      Adafruit_I2CRegisterBits(MaskEnable, 1, 3);
  return conversion_ready.read();
}*/
