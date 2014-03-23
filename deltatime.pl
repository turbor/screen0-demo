#!/usr/bin/perl
$|=1;
while (<>){
	if ( /\'(\d)\'.*emutime:\s*(\d+)/ ) {
		$info{$1}=$2;
		if ($1 == "2"){
			$d=$info{"2"}-$info{"1"};
			print " delta $d  " . ($d/8) ."\n";
		}
	}
}

