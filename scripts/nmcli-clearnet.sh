#!/bin/sh

# Author: Dzintars Klavins
# This script will delete all network connections and devices.
# WARNING!!! Network connection will be lost!

# All credits to: https://www.rene-pickhardt.de/index.html%3Fp=1955.html

# Delete all existing connections.
for i in `nmcli c | \
grep -o -- "[0-9a-fA-F]\{8\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{12\}"` ; \
do nmcli connection delete uuid $i ; \
done

# Delete all devices.
for i in `nmcli d | \
grep -o -- "[0-9a-fA-F]\{8\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{12\}"` ; \
do nmcli device delete uuid $i ; \
done

nmcli device -show
nmcli connection -show
