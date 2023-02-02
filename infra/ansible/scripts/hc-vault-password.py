#!/usr/bin/env python

import os
passwd='vault kv get -field=ansivault secret/ansible'
os.system(passwd)
