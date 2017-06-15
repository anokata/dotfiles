#!/usr/bin/python3
#сделать показ происходящего и прогресс.
from collections import defaultdict
class pddict(defaultdict):
    def __str__(self):
        t =''
        for k, v in self.items():
            t += str(k) + ': ' + str(v) + '\n'
        return t

class pdict(dict):
    def __str__(self):
        t =''
        for k, v in self.items():
            t += str(k) + ': ' + str(v) + '\n'
        return t

class BTree(dict):
    val = ''
    LEFT = 'left'
    RIGHT = 'right'
    isLeaf = True

    def __init__(self):
        super().__init__(self)
        self[BTree.LEFT] = ''
        self[BTree.RIGHT] = ''
    
    def _left(self):
        return self[BTree.LEFT]

    def _right(self):
        return self[BTree.RIGHT]
    
    def _sleft(self, val):
        self.isLeaf = False
        if type(val) == BTree:
            self[BTree.LEFT] = val
        else:
            b = BTree()
            b.val = val
            self[BTree.LEFT] = b
        return self._left

    def _sright(self, val):
        self.isLeaf = False
        if type(val) == BTree:
            self[BTree.RIGHT] = val
        else:
            b = BTree()
            b.val = val
            self[BTree.RIGHT] = b
        return self._right

    left = property(_left, _sleft)
    right = property(_right, _sright)

    def obxod(self, node, fun, procval=True):
        if type(node) == BTree:
            if procval:
                fun(node.val)
            else:
                fun(node)
            self.obxod(node.left, fun, procval)
            self.obxod(node.right, fun, procval)

    def getCodes(self, node, codes, curpath=''):
        if not node.isLeaf:
            self.getCodes(node.left, codes, curpath+'0')
            self.getCodes(node.right, codes, curpath+'1')
        else: #isLeaf
            codes.append((node.val[0], curpath))


    def tostr(self):
        return str(self.val)

    def _toStr(self, deep):
        deep += 1
        t = '' + str(self.val)
        t += '\n' + ' ' * deep
        if type(self.left) == BTree:
            t += self.left._toStr(deep)
        else: t += str(self.left)
        if type(self.right) == BTree:
            t += self.right._toStr(deep)
        else: t += str(self.right)
        t += ''
        return t

    def __repr__(self):
        t= self.tostr()
        return t
    __str__ = __repr__


def str2Bytes(s):
    r = list()
    for x in s:
        r.append(ord(x))
    return r

def hufEnc(msg):
    END = chr(255)*2 + 'END.'
    # посчитаем количество каждого символа
    print("Считаем частоту байтов")
    freq = pddict(int)
    for x in msg:
        freq[x] += 1
    # Добавим спец код для конца.
    freq[END] = 1
    # вычислим вероятность появления каждого символа
    print("Вычисляем вероятность каждого байта")
    for k, v in freq.items():
        freq[k] = (v, v/len(msg))
    # сделаем лес деревьв. отсортируем.
    forest = list()
    for k, v in freq.items():
        t = BTree()
        t.val = (k, v[0], v[1])
        forest.append(t)
    print("Сортируем в порядке невероятности")
    forest.sort(key=lambda k: k.val[1], reverse=True)
    print("Строим бинарное дерево")
    while len(forest) > 1:
        l = forest[-1]
        r = forest[-2]
        del forest[-1]
        del forest[-1]
        b = BTree()
        b.left = l
        b.right = r
        b.val = ('NEW', l.val[1] + r.val[1], l.val[2]+r.val[2])
        forest.append(b)
        forest.sort(key=lambda k: k.val[1], reverse=True)

    # теперь сделаем обход по листьям с запоминанием путя, получением кода для символов.
    print('Обходим дерево и получаем коды для байтов')
    codes = list()
    forest[0].getCodes(forest[0], codes, '')
    codes = pdict(codes)
    #Зашифруем сообщение
    print('Шифруем сообщение словарём этими кодами')
    msgEnc = ''
    for x in msg:
        msgEnc += (codes[x])
    endcode = codes[END]
    msgEnc += codes[END]
    msgEnc += codes[END] # добавив в конец конечных сиволов до дополнения байта
    if len(msgEnc)%8 != 0:
        msgEnc = msgEnc[:-(len(msgEnc)%8)] # обрежем до байта
    #Преобразуем в последовательность байт.
    msgBytes = list()
    print('Преобразуем коды 01 в байты')
    for x in range(0, len(msgEnc), 8):
        byte = int(msgEnc[x:x+8], 2)
        msgBytes.append(byte)
    #дописывать словарь.
    # формат: размер словаря(байт). последний элемент - элемент END
    print('Преобразуем в байты словарь кодов')
    msgKey = list()
    codeSize = len(codes) + 2 # плюс сама длинна
    ordCodes = list(codes.items())
    ordCodes.sort(key = lambda x: x[0]) # отсортируем чтобы конечный был в конце
    stopCode = 99 # конец кода текущего символа
    for k, v in ordCodes:
        msgKey.append(ord(k[0]))
        msgKey += str2Bytes(v)
        msgKey.append(stopCode)
        codeSize += len(v) + 1
    msgKey = [codeSize//256, codeSize%256] + msgKey

    msgKey += msgBytes
    print('Готово!')
    return msgKey
 

def hufDec(msg):
    END = chr(255)*2 + 'END.'
    stopCode = 99 # конец кода текущего символа
    #Получим размер словаря и словарь.
    count = (msg[0])*256 + (msg[1])
    codeBytes = msg[2:count]
    curCode = ''
    curByte = codeBytes[0]
    nextIsByte = True
    codes = dict()
    i = 0
    print('Декодируем словарь')
    for x in codeBytes:
        i += 1
        if nextIsByte:
            curByte = x
            nextIsByte = False
            continue
        if x != stopCode:
            curCode += chr(x) 
        else:
            # Подправим послдений код для конца 
            if i == len(codeBytes): 
                codes[END] = curCode
                break
            codes[curByte] = curCode
            curCode = ''
            nextIsByte = True

    msgBytes = msg[count:]
    endcode = codes[END]
    # Преобразуем в двоичную строку
    print('Преобразуем данные в двочный код')
    msg = ''
    for b in msgBytes:
        msg += "{0:08b}".format(b)

    #Расшифруем сообщение
    print('Расшифровываем данные по словарю')
    invCodes = {v: k for k, v in codes.items()} # инвентируем словарь
    curcode = ''
    msgDec = list()
    while msg != '':
        curcode += msg[0]
        msg = msg[1:]
        if curcode in invCodes:
            if curcode != endcode: # Пропускаем сдополняющие коды конца
                if curcode in invCodes: # и если это правильный код(неправильный - после обрезания)
                    msgDec.append(invCodes[curcode])
            curcode = ''
    print('Готово!')
    return msgDec

def packFile(fn):
    msg = ''
    print('Упаковываю файл %s'%fn)
    print('Читаю файл...')
    with open(fn, 'rb') as fin:
        while True:
            b = fin.read(1)
            if not b: break
            msg += chr(b[0])
    with open(fn+'.enc', 'wb') as fout:
        msg = hufEnc(msg)
        print('Записываю результат в %s'%(fn+'.enc'))
        for b in msg:
            fout.write(bytes([b]))


def unpackFile(fn):
    msg = list()
    print('Распаковываю файл %s'%fn)
    print('Читаю файл...')
    with open(fn, 'rb') as fin:
        while True:
            b = fin.read(1)
            if not b: break
            msg.append(ord(chr(b[0])))
    with open(fn+'.dec', 'wb') as fout:
        msg = hufDec(msg)
        print('Записываю результат в %s'%(fn+'.dec'))
        fout.write( bytearray(msg))

if __name__ == '__main__':
    import sys
    if len(sys.argv) < 3:
        print("Надо ввести аргументы: имя файла и режим(d или e)")
        exit()
    f = sys.argv[1]
    mode = sys.argv[2]
    if mode == 'd':
        unpackFile(f)
    elif mode == 'e':
        packFile(f)
    else:
        print("Неверный аргумент режима")
        exit()

