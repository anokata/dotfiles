DIR=$(./mktempramdir.sh)
git clone https://anokata@bitbucket.org/anokata/doc.git $DIR/doc
echo "$DIR/doc exported as DOC"
# run bash? and at exit push
export DOC=$DIR
