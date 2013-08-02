#!/usr/bin/env python
# Copyright (C) 2011 Lucas Maystre <lucas@maystre.ch>
#
# This file is part of propassgen.
#
# propassgen is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# propassgen is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with propassgen.  If not, see <http://www.gnu.org/licenses/>

"""
Generate a pronounceable password.

Be careful, the entropy is not necessarily a meaningful measure of security
here. *Guesswork entropy* would be the right concept.
"""

import math
import optparse
import os
import os.path
import random
import sys

from xml.etree import ElementTree


# Default location of source file.
DEFAULT_SOURCE = os.path.join(os.environ.get('TOOLS_ROOT', ''),
        'propassgen', 'source.xml')


def _init_trigram_table(symbols):
    table = {}
    for x in symbols:
        table[x] = {}
        for y in symbols:
            table[x][y] = {}
            for z in symbols:
                table[x][y][z] = 0
    return table


def parse_source(source_file):
    tree = ElementTree.parse(source_file)
    # Parse symbols
    symbols = ''
    symbs_elem = tree.find('symbols')
    for symb_elem in symbs_elem.iter('symbol'):
        symbols += symb_elem.get('value')
    # Parse frequencies
    frequencies = _init_trigram_table(symbols)
    seqs_elem = tree.find('sequences')
    for seq_elem in seqs_elem.iter('sequence'):
        trig = seq_elem.get('value')
        freq = int(seq_elem.get('frequency'))
        frequencies[trig[0]][trig[1]][trig[2]] = freq
    return symbols, frequencies


# Taken from http://stackoverflow.com/questions/4669391
def memo(func):
    cache = {}
    def wrap(*args):
        if args not in cache:
            cache[args] = func(*args)
        return cache[args]
    return wrap


@memo
def pmf(*args):
    assert len(args) in [1, 2, 3]
    if len(args) < 3:
        return sum([pmf(*args+(x,)) for x in SYMBOLS])
    else:  # len(args) == 3
        return FREQ_TABLE[args[0]][args[1]][args[2]] / float(TOTAL)


def cond(*args):
   # cond(x, y, z) = Pr{z | x, y}
   # cond(x, y) = Pr{y | x}
   # cond(x) = Pr{x}
   assert len(args) in [1, 2, 3]
   if len(args) == 1:
       return pmf(*args)
   else:
       try:
           return pmf(*args) / pmf(*args[:-1])
       except ZeroDivisionError:
           return 1.0 / len(SYMBOLS)


def entropy_rate(frequencies):
    # The formula's on Wikipedia: http://en.wikipedia.org/wiki/
    # Entropy_(information_theory)#Data_as_a_Markov_process
    try:
        return -1 * sum([cond(x) * sum([cond(x, y) * sum([
                cond(x, y, z) * log2(cond(x, y, z))
                for z in SYMBOLS]) for y in SYMBOLS]) for x in SYMBOLS])
    except:
        print x, ' ', y, ' ', z
        print cond(x,y,z)
        raise


def gen_passwd(length):
    assert length >= 3
    def init_passwd():
        # initialize the first three symbols
        pointer = random.randrange(TOTAL)
        counter = 0
        for x in SYMBOLS:
            for y in SYMBOLS:
                for z in SYMBOLS:
                    counter += FREQ_TABLE[x][y][z]
                    if counter >= pointer:
                        return x + y + z
    password = init_passwd()
    # Add symbols as long as the password is not long enough
    while len(password) < length:
        x, y = password[-2:]
        if pmf(x, y) == 0:
            # Handle the special case where there was no trigram starting with xy
            # Then we just assume they're equiprobable.
            password += random.choice(SYMBOLS)
            continue
        # It's important to round down in case it's not integer,
        # because of the next for loop.
        pointer = random.randrange(int(pmf(x,y) * TOTAL))
        counter = 0
        for z in SYMBOLS:
            counter += FREQ_TABLE[x][y][z]
            if counter >= pointer:
                password += z
                break
    return password



def log2(x):
    # Small wrapper around math.log that allows for zero values
    # This is ugly. But whatever. We clip the value to the largest float.
    return math.log(x, 2) if x > 0 else sys.float_info.max


def _parse_command():
    parser = optparse.OptionParser()
    parser.add_option('--qty', action='store', type='int',
            dest='quantity', default=1)
    parser.add_option('--length', action='store', type='int',
            dest='length', default=10)
    parser.add_option('--source', action='store', type='string',
            dest='source_file', default=DEFAULT_SOURCE)
    return parser.parse_args()


if __name__ == '__main__':
    options, args = _parse_command()
    SYMBOLS, FREQ_TABLE = parse_source(options.source_file)
    # Compute total number of elements.
    # Not the most readable thing in the world... Sorry.
    TOTAL = sum([sum([sum(y.values()) for y in x.values()])
            for x in FREQ_TABLE.values()])
    for i in range(options.quantity):
        print gen_passwd(options.length)
    print options.length*entropy_rate(FREQ_TABLE), 'bits of entropy'
