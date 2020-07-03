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
    textdest=${doc/pdf/txt}

    if [[ -s $textdest ]]
    then
      if [[ $(cat $textdest | wc -l) -gt 100 ]]
      then
        echo "$doc..skipping " $(wc -l $textdest)
        continue
      fi
    fi

    echo $doc
    echo "---"

    for path in $pdf $txt
    do
      [[ -e $path ]] && rm -fr $path
      mkdir -p $path
    done

    gs -r75  \
      -dBATCH  \
      -dNOPAUSE  \
      -sDEVICE=pngmono \
      -sOutputFile=$pdf/${base}-%03d.png $doc

    for png in $pdf/*png
    do
      fname=$(basename $png)
      tesseract $png $txt/${fname/.png/} -l eng
    done

    pageCount=$(ls $txt/*txt | wc -l)
    lineCount=$(cat $txt/*txt | wc -l)

    echo $pageCount $lineCount

    cat $txt/*txt > $textdest

  done
done



