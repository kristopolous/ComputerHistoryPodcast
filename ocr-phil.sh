#!/bin/bash
which=$1
pdf=/tmp/pdf-$which
base=page
txt=/tmp/txt-$which

for path in $PWD/PRE_1923_PDF/0${which}*
do
  ttl=$(ls $path/*pdf | wc -l)
  ix=0

  for doc in $path/*pdf
  do
    echo $doc
    echo "---"
    for path in $pdf $txt
    do
      [[ -e $path ]] && rm -r $path
      mkdir -p $path
    done

    convert -density 300 -depth 16 $doc $pdf/${base}.png
    echo "png"

    ix=0
    for png in $pdf/*png
    do
      fname=$(basename $png)
      tesseract $png $txt/${fname/.png/} -l eng
      ix=$(( ix + 1 ))
    done

    pageCount=$(ls $txt/*txt | wc -l)
    lineCount=$(cat $txt/*txt | wc -l)

    echo $pageCount $lineCount

    [[ -e ${doc/pdf/txt} ]] || cat $txt/*txt > ${doc/pdf/txt}

  done
done



