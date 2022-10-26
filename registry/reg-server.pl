
use strict;
use IO::Socket;
use Socket;
use Sys::Hostname;
use constant BUFSIZE => 1024;

# use port 7890 as default
my $port = shift || 7890;
my $proto = getprotobyname('tcp');
my $server = "localhost";  # Host IP running the server
my $socket; 

# create a socket, make it reusable
socket($socket, PF_INET, SOCK_STREAM, $proto)
   or die "Can't open socket $!\n";
setsockopt($socket, SOL_SOCKET, SO_REUSEADDR, 1)
   or die "Can't set socket option to SO_REUSEADDR $!\n";

# bind to a port, then listen
bind($socket, pack_sockaddr_in($port, inet_aton($server)))
   or die "Can't bind to port $port! \n";

listen($socket, 5) or die "listen: $!";
print "SERVER started on port $port\n";



while (my $client_addr = accept(my $new_socket, $socket)) 
{
   $new_socket->autoflush;
   my $name = gethostbyaddr($client_addr, AF_INET );
   print "Connection received from $name\n";

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
