#!/usr/bin/perl -wn
BEGIN {
    open("TBL", "$ARGV[0]") or die "Error opening user file: $ARGV[0]\n"; 
    while (<TBL>) {
	chomp;
	next if /^\s*$/;
	($file, $code) = split /\t/;
	$tbl{$code} = $file;
    }
    shift;
}

chomp;
next if /^\s*$/;
($code) = split /\t/;
$code =~ s|.*/||;
if (! defined $tbl{$code}) {
    die "Error coding $code in $_\n";
}
$fname = $tbl{$code};
#$fname =~ s|(...)|$1/$1|; 
print $fname, "\t", $_, "\n";

