#! /bin/bash
echo "==== start publish book =====" &&
git add . &&
git commit -m 'publish books' &&
git push &&
echo '==== publish book success ===='
echo

