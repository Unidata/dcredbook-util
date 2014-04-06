#!/bin/csh -f
# This script may be used as a pqact.conf action to automatically
# print Redbook graphics found on NOAAPORT.
# 
source /home/gempak/NAWIPS/Gemenviron
setenv PSDIR $GEMDATA/redbook/ps
cd $PSDIR

# The default postscript output is for 8.5" x 11" paper. If you have an alternate
# paper tray for 11" x 17" paper, you can specify it here.
#
#set DEV='PS|'$$'.ps|11;17|M'
set DEV='PS|'$$'.ps||M'

# Redirect to dcredbook_ps decoder
cat | dcredbook_ps -v 1 -d $GEMDATA/logs/dcredbook_ps.log 'PS|%P.ps||C'

exit 0
