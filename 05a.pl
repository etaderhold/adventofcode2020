for (<>) {
  /(.{7})(.{3})/;
  my $row = $1;
  my $col = $2;

  $row =~ tr/FB/01/;
  $col =~ tr/LR/01/;

  $row_num = oct("0b" . $row);
  $col_num = oct("0b" . $col);
  $id = $row_num * 8 + $col_num;
  $max_id = $id if $id > $max_id;
}

print $max_id, "\n";