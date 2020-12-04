for (<>) {
  chomp;
  $array[$_]++;
}

for (my $i = 0; $i < 2020; $i++) {
  for (my $j = $i; $j < 2020; $j++) {
    if ($array[$i] && $array[$j] && $array[2020-$i-$j]) {
      print $i * $j * (2020-$i-$j), "\n";
    }
  }

}