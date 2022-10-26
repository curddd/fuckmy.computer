
use IO::Handle;



use strict;
use IO::Socket;
use Socket;
use Sys::Hostname;

print "Content-type: text/html\n\n";

if (length ($ENV{'QUERY_STRING'}) > 0){
      $buffer = $ENV{'QUERY_STRING'};
      @pairs = split(/&/, $buffer);
      foreach $pair (@pairs){
           ($name, $value) = split(/=/, $pair);
           #$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
           $value =~ s/^([a-zA-Z0-9]+)$/;
           $in{$name} = $value; 
      }
}
else{
	die;
}

$user = $in{'user'};
$pass = $in{'pass'};


# initialize host and port
my $host = 'localhost';
my $port = 7890;
my $server = "localhost";  # Host IP running the server
my $socket;

# create the socket, connect to the port
socket($socket,PF_INET,SOCK_STREAM,(getprotobyname('tcp'))[2])
   or die "Can't create a socket $!\n";
connect($socket, pack_sockaddr_in($port, inet_aton($server)))
   or die "Can't connect to port $port! \n";
$socket->autoflush;

print $socket "$user $pass";
close $socket;

print "if you're lucky it worked and you can now ssh into this machine"
