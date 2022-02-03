use strict;
use warnings;

# Assignment 01B
# Loops through integers 1-100 and prints Fizz for values divisible by 3, Buzz for values
# divisible by 5, FizzBuzz when both conditions are met, and the integer itself
# when no conditions are met.
# Author: Frederick Baclig

# Loop that evaluates values from 1-100
for(my $i = 1; $i <= 100; $i++){
  # Prints FizzBuzz if value is divisble by 3 and 5
  if($i%3==0 and $i%5==0){
    print("FizzBuzz \n");
  }
  # Prints Fizz if value is divisble by 3 
  elsif($i%3==0){
    print("Fizz \n");
  }
  # Prints Buzz if value is divisble by 5
  elsif($i%5==0){
    print("Buzz \n");
  }
  # Prints the value if no other conditions are met.
  else{
    print("$i \n");
  }
}