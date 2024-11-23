#!/bin/bash

pwd | grep "src$" || cd src
doctoc .
sed -i "3d" ./*.md
sed -i "/](\#/d" ./SUMMARY.md
sed -i "8a`date`" ./update.md
cd ..

mdbook build
git add .
git commit -m "wip"
git push
