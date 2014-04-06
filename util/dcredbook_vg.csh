#!/bin/csh -f
#
source /home/gempak/NAWIPS/Gemenviron
setenv OUTDIR $GEMDATA/redbook/vg
if(! -e $OUTDIR) mkdir -p $OUTDIR
cd $OUTDIR

# run dcredbook_vg
cat | dcredbook_vg -v 1 -d $GEMDATA/logs/dcredbook_vg.log 'vg|%P/YYYYMMDD_HHNN.vgf'
gpend

exit 0
