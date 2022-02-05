use strict;
use warnings;

# Perl Assignment 3
# assignment done in the Perl implementing common programming concepts as
# Program arguments, arrays, and subroutines
# ICS 215
# Author: Fred Baclig
my $dieMsg = "Error: Expecting 1 program argument. Found " . @ARGV . " instead.\n";
$dieMsg = $dieMsg . "Usage: perl BacligFrederick03.pl filename\n";
die "$dieMsg" if (@ARGV != 1);
my $inputFile = $ARGV[0];
my @ccArray="";

# Used to temporarily store each line in the file as it is being read.
my $inputLine = "";

# Open a file handle for reading.
open inFH, "<", $inputFile;

# As long as the file has lines, store it in $inputLine, then print it out.
while ($inputLine = <inFH>) {
  # Any processing to the line will occur here in the loop.
  if($inputLine=~m/^3[47][0-9]{13}$/){
    push(@ccArray,"AMEX: $inputLine");
  }
  elsif($inputLine=~m/^4[0-9]{12}$|^4[0-9]{16}$/){
    push(@ccArray,"VISA: $inputLine");
  }
  elsif($inputLine=~m/^5[1-6]\d{14}$|222[1-9]\d{12}$|2720\d{12}$/){
    push(@ccArray,"MASTERCARD: $inputLine");
  }
}

# Done reading.
close inFH;
my $arrayLength = @ccArray;
print @ccArray
