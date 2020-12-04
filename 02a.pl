for (<>) {
  print;
  /(\d+)-(\d+) (.): (.*)/;
  $min = $1;
  $max = $2;
  $search = $3;
  $pw = $4;
  $count = () = $pw =~ /$search/gi;
  print $count, "\n";
  $x++ if $count >= $min && $count <= $max;
}

print "\n$x\n";