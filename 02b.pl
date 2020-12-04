for (<>) {
  print;
  /(\d+)-(\d+) (.): (.*)/;
  $i1 = $1;
  $i2 = $2;
  $search = $3;
  $pw = $4;
  $pw = ' ' . $pw;
  @chars = split //, $pw;
  next if $chars[$i1] eq $search && $chars[$i2] eq $search;
  next if $chars[$i1] ne $search && $chars[$i2] ne $search;
  $x++;
}

print "\n$x\n";