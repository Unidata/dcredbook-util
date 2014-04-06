#!/bin/csh -f
source /home/gempak/Gemenviron
setenv OUTDIR $GEMDATA/redbook/raw
setenv GIFDIR $OUTDIR/gifs

if (! -e $GIFDIR) mkdir -p $GIFDIR
cd $GIFDIR

# run dcredgook_gif
cat | dcredbook_gif -v 1 -d $GEMDATA/logs/dcredbook_gif.log  \
	-s $OUTDIR/%P_${1}_${2}_${3} \
	'gif|%P~YYYYMMDD_HHNN.'$$'.gif|1280;800'

set FILE=`ls *.$$.gif`
if ( -e $FILE ) chmod 644 $FILE
set ROOT=`echo $FILE:r`
set NAME=`echo $ROOT:r.gif`
set PROD=`echo $NAME | cut -f1 -d~`

if ( -e ${OUTDIR}/${PROD}_${1}_${2}_${3} ) chmod 644 ${OUTDIR}/${PROD}_${1}_${2}_${3}

mv $FILE ${PROD}.gif >>& $GEMDATA/logs/dcredbook_gif.log

scp -Bq ${PROD}.gif mjames@conan:/content/software/gempak/redbook/gifs/ \
    >>&! $GEMDATA/logs/dcredbook_gif.log
exit 0

