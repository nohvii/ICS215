

use strict;
use warnings;

# Outputs the low temperature forecast for a given day of the week.
# The day of the week is entered a program argument.
# Ensure the day of the week is in title case.
#
# For example, run the script with Monday:
#   perl lowtemp.pl Monday
#
# If something other than a day of the week is entered as a program
# argument, there will be no match and the script will end without output.
#
# Author: Ed Meyer

# The error and usage messages if there is not exactly 1
# program argument when this script is run.
my $dieMessage = "Error: Expecting 1 program argument, found " . @ARGV . " instead.\n";
$dieMessage .= "Usage: perl lowtemp.pl DayOfWeek\n";

# Ensure there is 1 program argument, otherwise terminate the script.
die $dieMessage if (@ARGV != 1);

# Retrieve the day of the week that was entered as a program argument.
my $dayOfWeek = $ARGV[0];

# The source code for the weather forecast.
# This is a multi-line string to simulate how the source
# would be presented if it were live code.
# For each day of the week, the forecast information is as follows:
#   Day of the week:
#   Weather in <weather> tags
#   High temperature in <temperature_f> tags
#   Low temperature in <temperature_f> tags
my $forecast = "Monday:
<weather>Sunny</weather>
<temperature_f>86.0</temperature_f>
<temperature_f>75.0</temperature_f>
Tuesday:
<weather>Sunny</weather>
<temperature_f>87.0</temperature_f>
<temperature_f>74.0</temperature_f>
Wednesday:
<weather>Partly Cloudy</weather>
<temperature_f>85.0</temperature_f>
<temperature_f>75.0</temperature_f>
Thursday:
<weather>Partly Cloudy</weather>
<temperature_f>85.0</temperature_f>
<temperature_f>76.0</temperature_f>
Friday:
<weather>Cloudy</weather>
<temperature_f>86.0</temperature_f>
<temperature_f>73.0</temperature_f>";

# Capture and output the low temperature for the given day of the week.
#
# Using the day of the week that was entered as a program argument,
# start a regex match from the day of the week, match until the second
# instance of <temperature_f> and capture the temperature.
# The temperature is in the form (\d\d\.\d).
# For example: 75.0
#
# This regex will NOT work: m#$dayOfWeek.+(\d\d\.\d)#s
# It will greedy match to Friday's low temperature.
#
# This regex will NOT work: m#$dayOfWeek.+(\d\d\.\d)#s
# It will non-greedy match the high temperature for a given day of the week.
#
# This regex WILL work: m#$dayOfWeek.+?</temperature_f>.+?(\d\d\.\d)#s
# It will properly match the day of the week and capture the second instance of the temperature.
if ($forecast =~ m#$dayOfWeek.+?<temperature_f>.+?<temperature_f>(\d\d\.\d)#s) {
 print $0;
}
