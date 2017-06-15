#!/usr/bin/python3
import subprocess
exc = subprocess.getoutput
import optparse
from PIL import Image, ImageDraw, ImageFont
# прога для рисования на изображении текста(из файла, статус системы...) и отображения его на фон, периодически
# args = periodic(secs?) textfile/syscmd to exec, bgimg file, fontcolor, fontsize
W = 1280
H = 1024
p = optparse.OptionParser()
p.add_option('--bg', default="")
p.add_option('--file', default="")
p.add_option('--fontsize', default=20)
p.add_option('--fontcolor', default='(100,50,255)')
options, arguments = p.parse_args()

if options.bg != '':
    imgpath = options.bg
    txt = Image.open(imgpath)
else:
    txt = Image.new('RGB', (W, H), (0,0,0))

if options.file != '':
    fn = options.file
else:
    fn = 'wallpaperText.py'
fontcolor = eval(options.fontcolor)
# создать имг или загрузить фон.
fontPath = "/usr/share/fonts/truetype/dejavu/"
f1 = 'DejaVuSansMono.ttf'
f2 = "DejaVuSans.ttf"
fontPath += f1
#fnt = ImageFont.truetype('Pillow/Tests/fonts/FreeMono.ttf', 20)
fnt = ImageFont.truetype(fontPath, int(options.fontsize))
# нанести текст(файла)
#print(txt, fnt)
d = ImageDraw.Draw(txt)
#d.text((10,10), "Hello", font=fnt, fill=(255,255,255))
text = ''
with open(fn, 'rt') as fin:
    text = ''.join(fin.readlines())
d.multiline_text((20,10), text, fill=fontcolor, font=fnt, anchor=None, spacing=5, align="left")
#txt.show()
# сохранить в файл
imgfn = 'walltext.png' 
txt.save(imgfn, 'PNG', optimize=True, compress_level=6)
# сделать фоном
exc('qiv -z ' + imgfn)
