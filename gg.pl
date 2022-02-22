use strict;
use warnings;

# Description:

# The program will output the class available seats
# Author: HeWeihao

# Declare all my variables here***************************************************
my $dieMessage = " ";
my $die_FH_Message = "Error:file can't be open";
#Storing the first argument in a scalar variable
my $courseArg = $ARGV[0];
#This is used for reading lines from the txt file later
my $inputFile = "sp22_ics_availability.html";
my $inputLine = "";
# To add the seats available
my $seatTotal = 0;
local $/;

# Terminate the scripte if the argument exceeded one or the file name is incorrect
# Automatically terminate if no argument or more than one argument
if(@ARGV != 1){
  $dieMessage = "Error: This Script only takes one argument. Found ". @ARGV. " instead.\n";
  $dieMessage = $dieMessage . "Usage: HeWeihao04 class name.\n";
  die "$dieMessage";
}

# Open a file handle to read sp22_ics_availability.html, terminate the script if unable.
open inFH, "<",$inputFile or die $die_FH_Message;
# Read the file, store the entire contents.
$inputLine = <inFH>;

# Done reading the file.
close inFH;

# Ensure no side effects later on in the script,
# re-initialize to newline.
$/ = "\n";

# Scrutiny for the course number user entered
# If no course match, script will be terminate.
if($inputLine !~ m#<td nowrap="nowrap" CLASS="default">ICS ($courseArg)</td>#){
  $dieMessage = "Course not found\n";
  die "$dieMessage";
}
# While loop that go beyond the first regex matche.
# (x+?) any characters in between
# (\d+) for available seat number, can match more than one digit.
# loop through the whole section and if matches found, add them to the $seatTotal
while ($inputLine =~ m#<td nowrap="nowrap" CLASS="default">ICS\s$courseArg<\/td>.+?<td class="default" align="center">.+?<\/td>.+?<td class="default" align="center">(\d+)#gs) {
        $seatTotal=$seatTotal+$1;
}
# Prints the total of available seats.
print "Seats available for this class: " . $seatTotal