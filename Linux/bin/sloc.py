#!/usr/bin/python3
import sys

def main():
  if len(sys.argv) < 2:
    print('Need arguments')
    return
  #print(sys.argv[1])
  loc = 0
  #check exist!
  with open(sys.argv[1], 'rt') as fin:
    for x in fin:
      if '' != x.strip():
        loc += 1
  print('LOC:', str(loc))

if __name__=='__main__':
  main()
