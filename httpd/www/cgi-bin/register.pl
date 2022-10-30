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

my $user = $in{'user'};
my @filter = $user =~ /([a-zA-Z0-9]+)/;
if($filter[0] eq ""){
	print "sorry, not compatibale username";
}

my $FIFO = "/var/www/cgi-bin/.reg_fifo";

$user = $filter[0];

my $line = "echo '${user}' > ${FIFO}";

#print "${line}\n";
#system($line);
open my $out, ">", $FIFO or die("cant open fifo $!");
print $out $user;
close $out;

print "if you're lucky it worked and you can now ssh into this machine with $user and pass secure"
