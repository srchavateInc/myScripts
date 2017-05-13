$act = <STDIN>;
$ENV{'PATH'} = "C:\Program Files\IBM\RationalSDLC1\clearcase\etc\utils";
chdir $ENV{'PATH'};
$cmd = `ucmutil lspvar -pvar UCM_INTEGRATION_ACTIVITY activity:$act`;
print $cmd;