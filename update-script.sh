#!/bin/bash
BASEDIR=" /var/cache/doc-gen/poppler-cpp-doc"
cd $BASEDIR/doc-repo/
find . ! -name .git ! -name README.md ! -name update-script.sh -maxdepth 1 -type f -delete
cd $BASEDIR/poppler-upstream/
git pull
cd cpp
rm -fr APIDOCS-html
doxygen Doxyfile
cp -fr APIDOCS-html/* $BASEDIR/doc-repo/
cd $BASEDIR/doc-repo/
git pull
git add .
git commit -m "`date +%Y-%m-%d`"
git push
