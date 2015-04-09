#!/bin/bash
cd /var/cache/poppler-cpp-doc/doc-repo/
find . ! -name .git ! -name README.md ! -name update-script.sh -maxdepth 1 -type f -delete
cd /var/cache/poppler-cpp-doc/poppler-upstream/
git pull
cd cpp
rm -fr APIDOCS-html
doxygen Doxyfile
cp -fr APIDOCS-html/* /var/cache/poppler-cpp-doc/doc-repo/
cd /var/cache/poppler-cpp-doc/doc-repo/
git add .
git commit -m "`date +%Y-%m-%d`"
git push
