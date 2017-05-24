import os
import csv
import math
import random
import string
import collections

PLACES = 1000000
STORES = 100000

codes = list(csv.reader(open(os.path.join(os.path.dirname(__file__), 'codes.csv'))))

c = collections.Counter()
for province, code in codes:
    c[province] += 1

total = 0
provinces = []
for province, chance in sorted(c.items(), key=lambda i: i[1]):
    total += float(c[province]) / len(codes)
    provinces.append((province, total))

province_codes = collections.defaultdict(list)
for province, code in codes:
    province_codes[province].append(code)

def make_name(prefix):
    return prefix + ' ' + ''.join(random.choice(string.ascii_lowercase) for _
                                      in range(random.randint(10, 20)))

def make_province():
    x = random.random()
    for province, chance in provinces:
        if x < chance:
            return province

    return provinces[-1][0]

def make_zip(province):
    return random.choice(province_codes[province])

def make_population():
    if random.random() < 0.2:
        return '\\N'
    return str(int(math.exp(random.random() * 20)))

def make_profit():
    if random.random() < 0.4:
        return '\\N'
    return str(int(random.random() * 2000))

print 'copy places from stdin;'
for _ in range(PLACES):
    print '\t'.join([make_name('City of'), make_province(), make_population()])
print '\\.'

print 'copy stores from stdin;'
for _ in range(STORES):
    p = make_province()
    print '\t'.join([make_name('Store called'), p, make_zip(p), make_profit()])
print '\\.'
