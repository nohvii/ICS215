use strict;
use warnings;

# Perl Assignment 4
#
# Using regular expression to capture data on a given webpage. The webpage is an archive of the Spring
# 2022 ICS Class Availability webpage. This perl scrip will output the sum total of available seats, 
# across all sections, for a given Leeward ICS course by applying a regex to capture seats available 
#information. When the user runs this script, they will provide a course number as a program argument, 
# the script will then read the webpage, apply a regex, and add up all the seats available for that course
# and output the result.
#
# Author: Frederick Baclig
#
# file we will be opening and processing
my $myFile = "sp22_ics_availability.html";

# variable we will be using to keep a running total
# of available seats
my $seatsTotal = 0;

# terminates the script if the user does not enter exactly 1 argument
die "Error: Expecting 1 program argument, found " . @ARGV . " instead.\nUsage: Perl BacligFrederick04.pl course_number\n" if (@ARGV != 1);

# continutes the script and stores the argument into a variable
# we will use to match a specific course number
my $courseArg = $ARGV[0];

# Undefine the record separator variable to grab the entire contents
# of the file when using the line-input operator <>
local $/;

# attempts to open the file, will terminate if file is not found 
# or can't be opened
open inFH, "<", $myFile or die "Unable to open sp22_ics_availability.html\n";

# stores the contents of the file into $fileContents
my $fileContents=<inFH>;

# done reading the file
close inFH;

# reinitialize the newline
$/ = "\n";

# terminate the script if no matches are found
die "No courses matched.\n" if ($fileContents !~ m#<td nowrap=\"nowrap\" CLASS=\"default\">ICS\s$courseArg</td>#);

# script will continue running if a match was found
# The while loop implemented here to iterate through the matches. 
# for seats available
# G and S flags are used for matching the contents of the file
while ($fileContents =~ m#$courseArg<\/td>.+?<td class=\"default\" align=\"center\">\d{1,2}.+?<td class+=\"default\" align=\"center\">(\d{1,2})#gs){
  # Running total of seats available for each course
  $seatsTotal = $seatsTotal + $1;
}

# Print the seats total available for the course
print "$seatsTotal\n\n";
print "Program Done\n";
