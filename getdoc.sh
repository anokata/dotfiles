DIR=$(./mktempramdir.sh)
git clone https://anokata@bitbucket.org/anokata/doc.git $DIR/doc
#cd $DIR
#git remote add ssh git@bitbucket.org:anokata/doc.git
echo "$DIR/doc exported as DOC"
# run bash? and at exit push
export DOC=$DIR
(cd $DIR/doc; bash)
