# -*- coding: utf-8 -*-
"""
Created on Wed Apr 14 22:13:51 2021

@author: 10128
"""
#import _io
f1 = open("ext_mem.dat", "r")
line = str()
#f = range(16)
f = [open("ext_mem_for_update_" + str(i // 2) + "_" + str(i % 2) + ".mif", "w") for i in range(32)]
flag = 0

for fi in f:
    fi.write("% multiple-line comment\n")
    fi.write("multiple-line comment %\n")
    fi.write("-- single-line comment\n")
    fi.write("DEPTH = 256;                    --The size of data in bits\n")
    fi.write("WIDTH = 16;                     --The size of memory in words\n")
    fi.write("ADDRESS_RADIX = HEX;            --The radix for address values\n")
    fi.write("DATA_RADIX = HEX;               --The radix for data values\n")
    fi.write("\n")
    fi.write("CONTENT                        --start of (address : data pairs)\n")
    fi.write("BEGIN\n")

    j = 0
    while 1 :
        if flag == 1 and j == 0:
            pass#print("start of the file")
        else:
            line = f1.readline()
        flag = 1
        if (not line or j >= 256) :
            break
        fi.write(hex(j)[2:] + " : " + line[0:len(line) - 5] + ";\n")
        j = j + 2
    fi.write("END;\n")
    fi.close()
f1.close()