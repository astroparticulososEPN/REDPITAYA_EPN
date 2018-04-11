open(TAT, 'fort.7');
$s=0;
$c=10**5;
`mkdir SH`;
open(TUT, '>SH/shower1.dat');
while(<TAT>){
	($a1,$a2,$a3,$a4,$a5,$a6,$a7) = split(' ',$_);
	if ($a1 == 33333300){
		close(TUT);
		$s += 1;
		open(TUT, '>', "SH/shower$s.dat");
		$c = 1;
		$ep = $a4;
	}
#	if ($c == 3){
#		print TUT "9000000 $ep $a4 $a5 ";
#	}
#	if ($c == 16){
#		print TUT "$a1 ";
#	}
#	if ($c == 18){
#		print TUT "$a7 0 0\n";
#	}
	
	if (($a1 > 1000) && ($a1 < 9999) && ($c != 3) && ($c != 16) && ($c != 18)){
		$v1 = $a1/1000;
		$v4 = (int($a1))%10;
		$part = int($v1);
		if ($v1 == 1){
			$m = 0;
		}
		if ($part == 2 || $part == 3){
			$m = 510.998928*10**(-6);
		}
		if ($part == 5 || $part == 6){
			$m = 105.658*10**(-3);
		}
		if ($part == 7){
			$m = 134.9766*10**(-3);
		}
		if ($part == 8 || $part == 9){
			$m = 139.57018*10**(-3);
		}
		$en = sqrt($m**2 + $a2**2 + $a3**2 + $a4**2);
		if ($v4 == 1 && $c1 != 33333300){
			print TUT "$part $a2 $a3 $a4 $a5 $a6 $a7 $en\n";
		}
	}
	$c += 1;
}
