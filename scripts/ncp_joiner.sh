#!/bin/bash

cd openthread
make -f examples/Makefile-nrf52840 clean
make -f examples/Makefile-nrf52840 JOINER=1 USB=1
cd output/nrf52840/bin
arm-none-eabi-objcopy -O ihex ot-ncp-ftd ot-ncp-ftd.hex
echo "----------------------"
echo ""
echo "Listing all /dev/ttyACM* devices:"
ls /dev/ttyACM*
echo ""
echo "----------------------"
echo ""
echo "----------------------"
echo ""
echo "MANUAL STEP REQUIRED:"
echo ""
echo "Run './nrfjprog -f nrf52 -s 683704924 --chiperase --program ~/DP/openthread/output/nrf52840/bin/ot-ncp-ftd.hex --reset' to flash the NS DK board or 'nrfutil pkg generate --hw-version 52 --sd-req 0x00 --application-version 1 --application ~/DP/openthread/output/nrf52840/bin/ot-ncp-ftd.hex ~/DP/openthread/output/nrf52840/bin/ot-ncp-ftd.zip && sudo nrfutil dfu usb-serial -pkg ~/DP/openthread/output/nrf52840/bin/ot-ncp-ftd.zip -p <device>' to flash the usb dongle'"
echo ""
echo "----------------------"