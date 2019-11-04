#!/bin/bash

cd ./openthread
make -f examples/Makefile-nrf52840 clean
make -f examples/Makefile-nrf52840 COMMISSIONER=1 JOINER=1
cd output/nrf52840/bin
arm-none-eabi-objcopy -O ihex ot-cli-ftd ot-cli-ftd.hex
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
echo "Run './nrfjprog -f nrf52 -s 683704924 --chiperase --program ./openthread/output/nrf52840/bin/ot-cli-ftd.hex --reset' to flash the NS DK board or nrfutil pkg generate --hw-version 52 --sd-req 0x00 --application-version 1 --application ./openthread/output/nrf52840/bin/ot-cli-ftd.hex ./openthread/output/nrf52840/bin/ot-cli-ftd.zip && sudo nrfutil dfu usb-serial -pkg ./openthread/output/nrf52840/bin/ot-cli-ftd.zip -p <device>"
echo ""
echo "----------------------"
