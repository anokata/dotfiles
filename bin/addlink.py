import bs4
import clipboard

filename = "/tmp/rainlin.html"
filename = "/home/ksi/dev/anokata.github.io/rainlin.html"
#link = sys.argv[1]
link = clipboard.paste()

with open(filename) as inf:
    txt = inf.read()
    soup = bs4.BeautifulSoup(txt, features="html5lib")

new_link = soup.new_tag("a", href=link)
new_link.string = link
soup.body.append(new_link)

with open(filename, "w") as outf:
    outf.write(str(soup))
