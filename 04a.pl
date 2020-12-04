%fields = {};

for (<>) {
  chomp;
  unless ($_) {
    if ($fields{'byr'} && $fields{'iyr'} && $fields{'eyr'} && $fields{'hgt'} && $fields{'hcl'} && $fields{'ecl'} && $fields{'pid'}) {
      $valid++;
    }
    %fields = {};
    next;
  }
  my @tokens = split / /;
  foreach my $token (@tokens) {
    $token =~ /(...):(.*)/;
    $fields{$1} = $2;
  }
}

if ($fields{'byr'} && $fields{'iyr'} && $fields{'eyr'} && $fields{'hgt'} && $fields{'hcl'} && $fields{'ecl'} && $fields{'pid'}) {
  $valid++;
}

print "$valid\n";