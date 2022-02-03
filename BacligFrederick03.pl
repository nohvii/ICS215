use strict;
use warnings;

# Perl Assignment 3
# assignment done in the Perl implementing common programming concepts as
# Program arguments, arrays, and subroutines
# ICS 215
# Author: Fred Baclig

my $inputFile = "cc_numbers.txt";
my @ccArray="";

# Used to temporarily store each line in the file as it is being read.
my $inputLine = "";

# Open a file handle for reading.
open inFH, "<", $inputFile;

# As long as the file has lines, store it in $inputLine, then print it out.
while ($inputLine = <inFH>) {
  # Any processing to the line will occur here in the loop.
  push(@ccArray,$inputLine);
}

# Done reading.
close inFH;
my $arrayLength = @ccArray;
print $arrayLength;
