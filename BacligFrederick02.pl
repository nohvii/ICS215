use strict;
use warnings;

# Perl Assignment 2
# assignment done in the Perl implementing common programming concepts as
# Program arguments, arrays, and subroutines
# ICS 215
# Author: Fred Baclig

# Store a complete exit message when the script terminates,
# state why the script terminated and how to run the script.
my $dieMessage = "Error: program_args.pl expects exactly 2 program arguments, found " . @ARGV . " instead.\n";
# Concatenate the usage message after the first error message line.
$dieMessage = $dieMessage . "Usage: perl program_args.pl arg1 arg2\n";

# Ensure there are exactly 2 program arguments before continuing
# the rest of the script.
die "$dieMessage" if (@ARGV != 2);

# Checks to make sure the first argument is > 0
# updates exit message to reflect the
# condition was not met.
if ($ARGV[0] <= 0) {
    $dieMessage = "Error: First integer argument $ARGV[0] must be greater than 0.\n";
}

# updates exit message if first argument is > second argument
elsif ($ARGV[0] >= $ARGV[1]) {
    $dieMessage = "Error: First integer argument $ARGV[0] must be less than the second argument $ARGV[1]. \n";
}

# exits script if first argument < 0 or first argument is > second argument
die "$dieMessage" if $ARGV[0] <= 0 || $ARGV[0] >= $ARGV[1];

# script continues after the correct conditions are met.

print "Counting from $ARGV[0] to $ARGV[1] is: ";
# calls countFirstToSecond routine passing the first and second argument
countFirstToSecond($ARGV[0], $ARGV[1]);
print "\n";

# calls sumFirstToSecond routine passing the first and second argument
# initializes summationResult variable to the value sumFirstToSecond returns
my $summationResult = sumFirstToSecond($ARGV[0], $ARGV[1]);
# prints the results returned by sumFirstToSecond
print "The summation from $ARGV[0] to $ARGV[1] is: $summationResult\n";

# calls fizzBuzzFirstToSecond routine passing the first and second argument
my $fizzBuzz = fizzBuzzFirstToSecond($ARGV[0], $ARGV[1]);
print "The FizzBuzz from $ARGV[0] to $ARGV[1] is:\n";
# prints the string returned by the subroutine.
print $fizzBuzz;

# subroutine that counts from first argument to second argument
sub countFirstToSecond{
  # stores first and second argument into variables
  my ($firstInt, $secondInt) = @_;
  
  # creates an array from first argument to the second argument
  my @myArray = ($firstInt..$secondInt);
  
  # while loop to iterate through each integer
  while (@myArray) {
    # used shift to print through the array
    my $arrayValue = shift@myArray;
    print "$arrayValue ";
  }
}

# subroutine that sums all numbers from first argument to the second argument
# and returns the total of all values
sub sumFirstToSecond {
  # declare and initialize variable "summation" and set to 0
  my $summation = 0;
  # doesn't state we had to use the same methods to retrieve and store
  # the variable as countFirstToSecond.
  # wanted to try a different method here
  my ($firstInt, $secondInt) = @_;
  my @myArray = ($firstInt..$secondInt);
  # loops through each integer adding it to the
  # running total and storing it into the summation variable
  while (@myArray) {
    $summation = $summation + shift@myArray;
  }
  # returns the sum of all integers via $summation
  return $summation;
}

# subroutine that adds all numbers from first argument to the second argument
# and returns the total of all values
sub fizzBuzzFirstToSecond {
  # stores first and second argument into variables
  my ($firstInt, $secondInt) = @_;
  # variable used to store and return the results
  # of this subroutine
  my $output = "";
  # used BacligFrederick01b.pl for this portion
  # edited to return the string instead
  # for loop starting at the first argument 
  # to the second argument passed in from the arguments
  for (my $i = $firstInt; $i <= $secondInt; $i++) {
    # concatenates FizzBuzz to output variable if value is divisble by 3 and 5
    if ($i % 3 == 0 and $i % 5 == 0) {
      $output = $output . "FizzBuzz\n";
    }
    # concatenates Fizz to output variable if value is divisble by 3 
    elsif ($i % 3 == 0) {
      $output = $output . "Fizz\n";
    }
    # concatenates Buzz to output variable if value is divisble by 5
    elsif ($i % 5 == 0) {
      $output = $output . "Buzz\n";
    }
    # concatenates the value if no other conditions are met.
    else {
      $output = $output . "$i\n";
    }
  }
  # returns the output variable after interating and processing through the arguments
  return $output;
}