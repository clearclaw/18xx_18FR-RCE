#! /bin/bash
set -e

ARGS=$*

lyx --export pdf2 ./1843-Rules.lyx
mkdir -p build
pushd build
  mv ../1843-Rules.pdf ./
  xxpaper ../1843-Papers.xxp $ARGS
  rm market_*-nooutline* || true
  #cp ../1843-Papers.xxp ./
  #cp ../README.txt ./
  #cp ../M43.pdf ./1843-Map.pdf
  #cp ../P43.pdf ./1843-Tiles.pdf
  for file in *.ps
  do
    ps2pdf $file
  done
  rm *.ps
popd
