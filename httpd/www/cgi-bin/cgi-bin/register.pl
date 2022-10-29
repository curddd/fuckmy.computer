#!/usr/bin/perl
use strict;
use warnings;


print "Content-type: text/html\r\n\r\n";
my %in;
if (length ($ENV{'QUERY_STRING'}) > 0){
      my $buffer = $ENV{'QUERY_STRING'};
      my @pairs = split(/&/, $buffer);
      foreach my $pair (@pairs){
           (my $name, my $value) = split(/=/, $pair);
           $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
           $in{$name} = $value; 
      }
}
else{
	print "no req body";
	die;
}

my $user = shift || $in{'user'};
my $pass = shift || $in{'pass'};


my $write_ln = "$user $pass";
my $FIFO = ".reg_fifo";

open(my $FH, ">", $FIFO) or die("couldnt open fifo thing\n");
print $FH $write_ln;
close($FH);


print "if you're lucky it worked and you can now ssh into this machine with $user and $pass"
