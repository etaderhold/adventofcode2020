for (<>) {
  /(.{7})(.{3})/;
  $row_id = $1;
  $row_id =~ tr/FB/01/;
  $col_id = $2;
  $col_id =~ tr/LR/01/;

  $row = oct("0b" . $row_id);
  $col = oct("0b" . $col_id);
  $taken{$row * 8 + $col}++;
}

for (0..1024) {
  print if ($taken{$_-1} && $taken{$_+1} && !$taken{$_});
}

print "\n";