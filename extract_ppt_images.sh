#!/bin/bash

PPT_EN=ppt_en.pptx
PPT_EN_MD5=95b6edf68e225f73a6055a55497dc270
TEMPDIR=temp
OUTDIR=img

rm -r ${TEMPDIR}
unzip ${PPT_EN} -d ${TEMPDIR}

if [[ -n `which md5sum 2>/dev/null` ]]; then
    if [[ `md5sum ${PPT_EN} | awk '{print $1}'` != ${PPT_EN_MD5} ]]; then
	echo "The source PPTX file has changed. Extraction may fail..." >&2
    fi
fi

mkdir -p ${TEMPDIR} ${OUTDIR}
cp ${TEMPDIR}/ppt/media/image5.png ${OUTDIR}/sakura.png
cp ${TEMPDIR}/ppt/media/image2.png ${OUTDIR}/ribbon_small.png
cp ${TEMPDIR}/ppt/media/image3.png ${OUTDIR}/ribbon_big.png
