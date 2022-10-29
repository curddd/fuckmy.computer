$FIFO = "/var/www/.reg_fifo";

unless(-p $FIFO){
	unlink $FIFO;
	require POSIX;
	POSIX::mkfifo($FIFO, 0700);
	system("chown root:apache $FIFO");
	system("chmod g+w $FIFO");
}



my $fifo_fh;
open($fifo_fh, "+< $FIFO") or die "The FIFO file \"$FIFO\" is missing, and this program can't run without it.";

while(<$fifo_fh>){
	print $_;

	create_user($_);
}
# should never really come down here ...
close $fifo_fh;
exit(0);
sub create_user{
	my @user= $_ =~ m/([a-zA-Z0-9]+)/;

	print ";; $user[0] \n";
	my $user = $user[0];

	print "\n\n filtered username: $user \n\n";
	my $pass = "secure";

	my $salt = "\$6\$jj\$";
	my $hash = crypt($pass,$salt) or die "cant hash";
	print "hash pass $hash\n";
	my $to_sys = "useradd -m -l -p '${hash}' ${user}\n";
	print "${to_sys}\n\n";
	system($to_sys);
}
