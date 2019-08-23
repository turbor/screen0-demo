#!/usr/bin/perl
open FILE,"< $ARGV[0]" or die "couldn't open file $ARGV[0]\n";
do { $_=<FILE> } until /^\"/;;
/(\d+)\s+(\d+)\s+(\d+)\s+(\d+)/;
($width,$height,$colors,$charspercol)=($1,$2,$3,$4);
$nr=0;
for $i (1 .. $colors){
	$_=<FILE>;
	/^\"(.{$charspercol})\s+c\s+\#(..)(..)(..)/;
	($code,$R,$G,$B)=($1,$2,$3,$4);
	$colorcomp{$nr}->{R} = hex($R);
	$colorcomp{$nr}->{G} = hex($G);
	$colorcomp{$nr}->{B} = hex($B);
	print "$nr: $code ,$R,$G,$B\n";
	$color{$code}=$nr++;
};

for $i (1 .. $height){
	$_=<FILE>;
	s/.*\"(.*)\".*/$1/;
	$y=$i-1;$x=0;
	undef @lijst;
	@cols= /(.{$charspercol})/g;
	for $j ( @cols ){
		$screen[$x][$y]=$color{$j};
		print "screen[$x][$y]=$color{$j}\n";
		$x++;
	};
};
close FILE;

$filename=$ARGV[0];
$filename=~s/\.xpm$/\.db/i;
open FILE,"> $filename" or die "couldn't open file $filename for writing\n";
##print GE5 header
#printf FILE "%c%c%c%c%c%c%c",0x41,144,0,0,0,256-144,0;
$height--;
$width--;
for $y (0 .. $height){
	undef @lijst;
	for $x (0 .. $width ){
		$c=$screen[$x][$y];
		push @lijst,sprintf"#%02x",$c
	}
	print " db ",join",",@lijst;
	print "\n";
	print FILE " db ",join",",@lijst;
	print FILE "\n";
};

#seek(FILE, 7 + 30336,0);
#for $i (0 .. 15){
#	$r=int($colorcomp{$i}->{R}/32);
#	$g=int($colorcomp{$i}->{G}/32);
#	$b=int($colorcomp{$i}->{B}/32);
#	$c=16*$r+$b;
#	printf FILE "%c",$c;
#	printf FILE "%c",$g;
#}
close FILE;
