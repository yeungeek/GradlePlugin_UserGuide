#! /bin/bash
echo "start publish book" &&
git add . &&
git commit -m 'pushlish books' &&
git push &&
echo 'publish book success'
echo

