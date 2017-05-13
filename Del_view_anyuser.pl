#!/usr/bin/perl -w
# changing the script for sandeep
print "enter the username: "; 
$usr = <STDIN>;
$COMMAND = "cleartool lsview -s | findstr $usr";
@views = `$COMMAND`;
$size = scalar(@views);
printf "$size \n";
for ($i=0; $i<$size; $i++)
{
	$display = $i+1;
	$get_view = $views[$i];
	@uuid = get_uuid($get_view);
	print "$display. $views[$i] @uuid\n";
	$cmd2 = `cleartool rmtag -view $views[$i]`;
	$cmd3 = `cleartool unreg -view -uuid @uuid`;
	$cmd4 = `cleartool rmview -f -all -uuid @uuid`;
	system ($cmd2, $cmd3, $cmd4);
}

sub get_uuid () {
        $get_view  = shift @_;
        $uuid = "";
        if ($get_view) {
                @lsview_out = split(/\n/, `cleartool lsview -l $get_view 2>nul`);
                foreach (@lsview_out) {
                        if ($_ =~ /View tag uuid:(.*)/) {($uuid = $1) =~ s/\s//g;}
                }
        }
        return $uuid;
}

