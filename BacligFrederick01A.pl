use strict;
use warnings;

# Assignment 01A
# Calculates the hypotenuse of 2 values entered by the user
# Prints 0 if any value is less than or equal to 0
# Author: Frederick Baclig

# Used to store the number entered by the user
my $firstLeg=0;
my $secondLeg=0;

print "Calculate the hypotenuse given both legs\n";
# Prompts user to enter a value for the first leg
# and stores in firstLeg
print "Enter the length of the first leg: ";
# chomp removes newline character and the end of any string
chomp($firstLeg = <STDIN>);
# Prompts user to enter a value for the first leg
# and stores in secondLeg
print "Enter the length of the second leg: ";
chomp($secondLeg = <STDIN>);
print "~~~~~~~~~~~~~~~~~~~~\n";
# If users enteres a value less than or equal to 0 the output will be 0
# if condition is not met it will proceed to calculate and
# output the result
if($firstLeg<=0 || $secondLeg<=0){
    print('hypotenuse: 0');
}
else{
    print "Hypotenuse: " . sqrt(($firstLeg * $firstLeg) + ($secondLeg *$secondLeg)) . "\n";
}