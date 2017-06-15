#!/usr/bin/python3
import requests as req
import sys
import os
work_dir = sys.path[0]
lib_dir = os.path.join(work_dir, './lib')
sys.path.append(lib_dir)
from pystore_urls import *
import argparse
import subprocess
exc = subprocess.getoutput

def get_clipboard():
    return exc('xclip -o')

parser = argparse.ArgumentParser()
parser.add_argument('--command', help='one of: load, save, book, all, books')
parser.add_argument('-name', help='name of value')
parser.add_argument('-s', help='script mode')
parser.add_argument('-c', help='get data from clipboard')
args = parser.parse_args()

def load(name):
    res = req.post(load_client, {'name': name})
    return res.text

def get_all():
    res = req.get(get_all_client)
    return res.text

def get_books():
    res = req.get(get_books_client)
    return res.text

def save(name, data):
    res = req.post(save_client, {'data':data, 'name':name})
    return res.text

def book(name, page):
    save('book_'+name, 'page_'+page)

#TODO get book

def get_urls():
    pass

def save_cmd(args):
    args.name = get_name(args)
    data = get_data(args) 
    save(args.name, data)

def load_cmd(args):
    args.name = get_name(args)
    print(load(args.name))

def all_cmd(_):
    print(get_all())

def books_cmd(_):
    print(get_books())

def book_cmd(args):
    args.name = get_name(args)
    data = get_data(args) 
    book(args.name, data)

def book_menu_cmd(args):
    books = get_books().strip().split('\n')
    count = len(books)
    keys = list('123456789abcdefghijklmnopqrstuvwxyz')
    n = 0
    for book in books:
        print("({}) {}".format(keys[n], book))
        n += 1
    n = input('Select: ')
    n = ord(n) - ord('1')
    if n >= count:
        print('out of range')
        exit()
    book_name = books[n].split(':')[0].strip()
    args.name = book_name
    book_cmd(args)
    books_cmd(args)

cmds = {
        'save': save_cmd,
        's': save_cmd,
        'store': save_cmd,
        'set': save_cmd,
        'l': load_cmd,
        'load': load_cmd,
        'get': load_cmd,
        'g': load_cmd,
        'all':all_cmd,
        'a':all_cmd,
        'books':books_cmd,
        'bs':books_cmd,
        'b':book_cmd,
        'book':book_cmd,
        'B':book_menu_cmd,
        }
def exec_cmd(args):
    cmd = cmds.get(args.command, False)
    if cmd:
        cmd(args)
    else:
        print('no that cmd')

def get_data(args):
    if args.c:
        data = get_clipboard()
    else:
        #TODO ask for get clip
        data = input('enter data:')
    return data

def get_name(args):
    if args.name == None:
        args.name = input('enter name:')
    return args.name



def menu():
    print('Avaliable commands')
    for k in cmds.keys():
        print(k, end=',')
    print('\n')
    command = ''
    while command not in cmds.keys():
        command = input('Enter command:')
        cmd = cmds.get(command, False)
        if cmd:
            cmd(args)
        else:
            print('no that cmd')

if __name__=='__main__':
    if args.s:
        exec_cmd(args)
    else:
        menu()
