/**
 * This file adds behaviors to the text input and checkbox input elements using the addEventListener method.
 * Regex is applied to the value of the text to validate the strength of a password
 * the keyup event triggers, that is when the user lifts their finger from the key.
 * Also checking the checkbox will reveal the password and vice versa.
 *
 * @author Frederick Baclig
 */

// Get the elements to add events to them.
let inputPassword = document.getElementById("password");
let inputCheckBox = document.getElementById("myCheckBox");
let elementFeedBack = document.getElementById("feedback");

// regexes to valide the requirements of a password.
let containsUpperCase = /[A-Z]/;
let containsLowerCase = /[a-z]/;
let containsDigit = /[\d]/
let containsSpecialChar = /[^a-zA-Z\d]/;

// applies each regex to the password and notifies
// the user of any missing requirements
inputPassword.addEventListener("keyup", function(){
  // store the value of the password element to make life easier
  let valPassword = inputPassword.value;
  // sets the variable to concatenate any missing requirements
  // should be 0 if all are met.
  let passwordFeedBack = "";
  if(!containsUpperCase.test(valPassword)) {
    passwordFeedBack = passwordFeedBack + "Password does not contain a uppercase letter<br>";
  }
  if(!containsLowerCase.test(valPassword)) {
    passwordFeedBack = passwordFeedBack + "Password does not contain a lowercase letter<br>";
  }
  if(!containsDigit.test(valPassword)) {
    passwordFeedBack = passwordFeedBack + "Password does not contain a number<br>";
  }
  if(!containsSpecialChar.test(valPassword)) {
    passwordFeedBack = passwordFeedBack + "Password does not contain a special character<br>";
  }
  if(valPassword.length < 8){
    passwordFeedBack = passwordFeedBack + "Password needs to contain at least 8 characters<br>";
  }
  // checks to see if all requirements are met
  // outputs Password is strong when true.
  if(passwordFeedBack.length == 0){
    passwordFeedBack =  "Your password is Strong";
  }
  // this is where the user is informed of any misisng requirements or if all of them are met
  elementFeedBack.innerHTML = passwordFeedBack;
});

// Checkbox to reveal or hide user's password.
inputCheckBox.addEventListener("click", function() {

  if(inputCheckBox.checked) {
   inputPassword.setAttribute("type", "text");
  } else {
   inputPassword.setAttribute("type", "password");
  }
});