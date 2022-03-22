/**  Javascript assignment 02
 * 
 *   This file adds event listeneres to each input in js_baclig_02.html
 *   that triggers the other quantities for each ingredient to update when 
 *   a value has changed.
 * 
 *   Author: Frederick Baclig
 */

// Get each ingredient's element to later assign a event to them
// and used to store it's default values into an array
let elementServings = document.getElementById('inputServings');
let elementCanSpam  = document.getElementById('inputCanSpam');
let elementNori     = document.getElementById('inputNori');
let elementRice     = document.getElementById('inputRice');
let elementResetBtn = document.getElementById('resetRecipe');

// array created to store the default values of each input
const defaultVal = [
  elementServings.value, 
  elementCanSpam.value, 
  elementNori.value, 
  elementRice.value
];

// adds a eventlistener for the reset button to reset
// each input box to it's default value once the button
// is clicked.
elementResetBtn.addEventListener("click", function() {
  elementServings.value = defaultVal[0];  
  elementCanSpam.value  = defaultVal[1]; 
  elementNori.value     = defaultVal[2]; 
  elementRice.value     = defaultVal[3]; 
});

// The following are event listeners for each ingredient's element
// when a value is changed it calls the updateElements function
// and passes it's corressponding index in the array
elementServings.addEventListener("change", function() {
  updateElements(0);
});

elementCanSpam.addEventListener("change", function() {
  updateElements(1);
});

  elementNori.addEventListener("change", function() {
  updateElements(2);
});

  elementRice.addEventListener("change", function() {
  updateElements(3);
});

// updateElements function that gets triggered when a 
// change occurs within the ingredients input boxes
function updateElements(elementNum) {

  // stores the element for each ingredient by retrieving all inputs
  // with the type of number
  let elementList = document.querySelectorAll('input[type="Number"]');
  
  // EC: if a user changes the input of one of the ingredients and the input
  // happens to be a negative number it will alert the user and retrieve the 
  // absolute value of the input and replace it in the input box
  if (elementList[elementNum].value < 0) {
    alert(`Alert: The number entered: ${elementList[elementNum].value} cannot be negative and will be changed to ${Math.abs(elementList[elementNum].value)}`);
    elementList[elementNum].value = Math.abs(elementList[elementNum].value);
  }
  
  // calculates the ratio of the user's new input and uses it to
  // update the other ingredients quantities.
  let newRatio = elementList[elementNum].value/ defaultVal[elementNum];

  // loops through the list of elements matched in the querySelectorAll method
  for (let i = 0; i < elementList.length; i++) {

    // if statement used to update all elements with the exception of the index 
    // that was passed to the updateElements function.
    // I.E if 0 was passed it will update elementList[1](CanSpam), elementList[2](Nori), elementList[3](Rice)
    // and exclude elementList[0](Servings).
    if (i != elementNum) {
      
      // Uses the new proportion ratio to adjust the values of all the ingredients proportionally
      elementList[i].value = defaultVal[i] * newRatio;
    }  
  }
}