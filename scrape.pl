#!/usr/bin/perl -w

use strict;
use warnings;
use Net::FTP;

# load options from file.
my $ftp = Net::FTP->new("", Debug => 0) or die 
	"Cannot connect.\n";

$ftp->login("", "") or die "Cannot login ", $ftp->message;

$ftp->cwd("/public_html") or die "Cannot change working directory ", $ftp->message;

$ftp->get("web.js") or die "get failed ", $ftp->message;

my @contents = $ftp->ls("/public_html");

foreach my $i (@contents) {
	print $i, "\n";
}

$ftp->quit;

