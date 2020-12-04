for (<>) {
  chomp;
  $_ x= 100;
  push @rows, $_;
}

foreach my $row (@rows) {
  next if $j++ % 2;
  $trees++ if substr($row, $i, 1) eq '#';
  $i += 1;
}

print "$trees\n";