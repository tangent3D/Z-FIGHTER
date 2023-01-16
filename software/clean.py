#!/usr/bin/env python
import os
from glob import glob
import argparse

EXT = ['*_CODE.bin','*_DATA.bin','*_BSS.bin','*_UNASSIGNED.bin','*.lis','*.map','*.def','*.err,','*.ticks_history.txt','*.sym']
EXT_ALL = ['zf_lib.lib','*.bin','*.rom','*.com','*.COM','*.o']

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--all", action='store_true', help="Remove all intermediate files")
    args = parser.parse_args()

    for e in EXT + EXT_ALL if args.all else EXT:
        for f in glob(os.path.join(os.getcwd(), f"**/{e}"), recursive=True):
            os.remove(f)

if __name__ == "__main__":
    main()
