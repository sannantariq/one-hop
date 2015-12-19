#!/usr/bin/python

import os
import sys

FILE_NAME = "officesNov23/bt/bt-rssi-%.4d.dat"
ADDR = '98:4F:EE:03:6E:18'
RUNS = 5
THRESH = 5

def main():
	if len(sys.argv) < 2:
		usage()
	else:
		rssi()

def usage():
	print "Usage ./bt_rssi.py <%s>" % 'distance'
	sys.exit(0)
def rssi():
	global RUNS
	global THRESH
	global ADDR
	tries = 0
	correct = 0
	distance = int(sys.argv[1])

	with open(FILE_NAME % distance, 'a') as f:
		pass

	while (tries < RUNS) and (correct < THRESH):
		f = os.popen('hcitool rssi %s' % ADDR)
		print "Attempt %d" % tries
		raw = f.read().strip()
		f.close()
		if "Not connected" in raw:
			print "attempting to connect"
			connect()
		else:
			raw = raw.split()
			val = int(raw[3])
			if (val <= 0):
				with open(FILE_NAME % distance, 'a') as f:
					f.write('%.3d\n' % val)
				print "RSSI = %d" % val
				correct += 1
			else:
				print "No valid value found"
		tries += 1

def connect():
	with os.popen('./connect_bt.sh') as f:
		pass
	time.sleep(0.5)

main()




