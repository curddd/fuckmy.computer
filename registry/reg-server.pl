#!/usr/bin/perl
use strict;
use Socket;
use Carp;

my $NAME = '/var/www/cgi-bin/regsock';
my $uaddr = sockaddr_un($NAME);
my $proto = getprotobyname('tcp');

socket(my $server, PF_UNIX, SOCK_STREAM, 0) || die "socket: $!";
unlink($NAME);
bind($server, $uaddr) || die "bind: $!";
listen($server, 5) or die "listen: $!";
print "SERVER started on $NAME $uaddr\n";

system('chmod 770 /var/www/cgi-bin/regsock');
system('chown apache:apache /var/www/cgi-bin/regsock');

while (my $client_addr = accept(my $new_socket, $server)) 
{
   print $new_socket "Hello from the server\n";

   while (my $recd = <$new_socket>) {
       chomp $recd;
       print "Got from client: $recd\n";
	my @up = split(/ /, $recd);
	create_user(@up);
       print $new_socket "Response from server to |$recd|\n";
   }   
   close $new_socket;
}

sub create_user{
	my @up = @_;
	my $hash = crypt($up[1],"85ng3jt39804t3n345gj34");
	system("useradd -g webusers -l -m -p $hash $up[0]");
}
