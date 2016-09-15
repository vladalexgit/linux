#!/bin/bash

PCI=$(lspci | grep Ethernet | cut -d ' ' -f1)
PCIPATH=$(find /sys -name 0000:$PCI | grep pci0000)

echo $PCI
echo $PCIPATH

echo 1 | sudo tee $PCIPATH/reset

sudo ip l s dev eno1 down
sudo ip l s dev eno1 up
