#!/usr/bin/env python

xorbyte = 'x'

infilename = 'payload.h'
outfilename = 'payload-xored.h'

import sys
try:
    r = open(infilename).read()
except:
    sys.stderr.write('Unable to read {}. Exiting...\n'.format(infilename))
import re
with open(outfilename,'w') as w:
    w.write(re.sub(r'\\x[0-9a-fA-F]{2}', lambda x: '\\x{:02x}'.format(int(x.group()[2:],16) ^ ord(xorbyte)), r))
sys.stderr.write('{} created.\n'.format(outfilename))
