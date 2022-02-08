use strict;
use warnings;

# Perl Assignment 3
#
# perl script that will read in a text file(passed
# as a argument) of possible credit card numbers 
# and attempt to categorize them to major credit card networks: 
# American Express (Amex), Visa, Mastercard
#
# ICS 215
#
# Author: Fred Baclig

# die message to notify user they entered the incorrect amount of arguments.
my $dieMsg = "Error: Expecting 1 program argument. Found " . @ARGV . " instead.\n";
$dieMsg = $dieMsg . "Usage: perl BacligFrederick03.pl filename\n";

# exits script if user does not enter exactly 1 argument
die "$dieMsg" if (@ARGV != 1);

# store filename passed as a argument into variable
my $inputFile = $ARGV[0];
# name of file we will be writing the matched CC's too
my $outputFile="matched_cc_numbers.txt";
# variable used to temp store the read lines from file
my $inputLine="";
# array used to store the cc numbers when found
my @ccArray="";

# Open a file handle for reading
# Exits script if file cannot be opened
open inFH, "<", $inputFile or die "Unable to open file: $inputFile\n";

# As long as the file has lines, store it in $inputLine, then process for cc numbers
while ($inputLine = <inFH>) {

  # matches regex for AMEX and adds to the end of the array if true.
  if($inputLine=~m/^3[47][0-9]{13}$/){
    push(@ccArray,"AMEX: $inputLine");
  }
  # matches regex for VISA and adds to the end of the array if true.
  elsif($inputLine=~m/^4[0-9]{12}$|^4[0-9]{16}$/){
    push(@ccArray,"VISA: $inputLine");
  }
  # matches regex for MASTERCARD adds to the end of the array if true.
  elsif($inputLine=~m/^5[1-6]\d{14}$|222[1-9]\d{12}$|2720\d{12}$/){
    push(@ccArray,"MASTERCARD: $inputLine");
  }
}

# done reading
close inFH;

# print matched cc numbers
print @ccArray;

# Done reading.
# open a file handle for writing
open outFH, ">", $outputFile;

# writes matched cc numbers found in cc_numbers.txt to matched_cc_numbers.txt
print outFH @ccArray;

# finished writing
close outFH;

# pau!
print "\n";
print "Program done!";
