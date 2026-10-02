import argparse
import json
import time
import sys


parser = argparse.ArgumentParser(description="Random Number Generator")
parser.add_argument("-f", "--from-val", type=int, default=0, help="number to start from (Default 0)")
parser.add_argument("-t", "--to", type=int, default=10, help="number to go to (Default 10)")
args = parser.parse_args()


from_val = args.from_val
to_val = args.to

def Output(ok, random):
    if ok and not str(random) == "null":
        data = {"ok": True, "random": random}
    else:
        data = {"ok": False, "random": None}

    print(json.dumps(data))
    sys.exit()

a = 1103515245
c = 12345
m = 2**31

def lcg(x_n, a, c, m):
    return (a * x_n + c) % m

def generateSeed():
    return int(time.time_ns())

def getRandomNumber(min_val, max_val):
    raw = lcg(generateSeed(), a, c, m)
    return min_val + (raw % (max_val - min_val + 1))


Output(True, getRandomNumber(from_val, to_val))
