
use IO::Handle;



use strict;
use IO::Socket;
use Socket;
use Sys::Hostname;
use constant BUFSIZE => 1024;

# initialize host and port
my $host = shift || 'localhost';
my $port = shift || 7890;
my $server = "localhost";  # Host IP running the server
my $socket;

# create the socket, connect to the port
socket($socket,PF_INET,SOCK_STREAM,(getprotobyname('tcp'))[2])
   or die "Can't create a socket $!\n";
connect($socket, pack_sockaddr_in($port, inet_aton($server)))
   or die "Can't connect to port $port! \n";
$socket->autoflush;

print $socket "test_user pass";
close $socket or die "close: $!";

