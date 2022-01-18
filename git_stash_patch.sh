git stash show -p > ../offline.patch
git diff --patch > ../diff.patch
git apply -R ../diff.patch
sed -n 469p ../diff.patch
