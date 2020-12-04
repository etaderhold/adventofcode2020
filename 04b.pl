%fields = {};

for (<>) {
  chomp;
  unless ($_) {
    validate();
    %fields = {};
    next;
  }
  my @tokens = split / /;
  foreach my $token (@tokens) {
    $token =~ /(...):(.*)/;
    $fields{$1} = $2;
  }
}

validate();
print "$valid\n";

sub validate {
  if ($fields{'byr'} && $fields{'byr'} >= 1920 && $fields{'byr'} <= 2002 &&
      $fields{'iyr'} && $fields{'iyr'} >= 2010 && $fields{'iyr'} <= 2020 &&
      $fields{'eyr'} && $fields{'eyr'} >= 2020 && $fields{'eyr'} <= 2030) {
    $this_valid = 1;
    if ($fields{'hgt'} && $fields{'hgt'} =~ /(\d+)(\w+)/) {
      if ($2 eq 'in') {
        $this_valid = 0 if $1 < 59 || $1 > 76;
      } elsif ($2 eq 'cm') {
        $this_valid = 0 if $1 < 150 || $1 > 193;
      } else {
        $this_valid = 0;
      }
    } else {
      $this_valid = 0;
    }

    $this_valid = 0 unless $fields{'hcl'} && $fields{'hcl'} =~ /^#[0-9a-f]{6}$/;

    $this_valid = 0 unless $fields{'ecl'} eq 'amb' || $fields{'ecl'} eq 'blu' || $fields{'ecl'} eq 'brn' || $fields{'ecl'} eq 'gry' ||
        $fields{'ecl'} eq 'grn' || $fields{'ecl'} eq 'hzl' || $fields{'ecl'} eq 'oth';

    $this_valid = 0 unless $fields{'pid'} && $fields{'pid'} =~ /^\d{9}$/;

    $valid += $this_valid;
  }
}
