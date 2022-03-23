/* Adapted from the Hawaii's voter registration application 
*  we use javascript to validate each of the fields presented in the HTML document
*  using a submit event as well as a click event to automatically enter certain fields
*  
*  Javascript Assignment 04
*
*  Frederick Baclig
*/
document.voterapp.addEventListener("submit", function(eventParam) {
  //regex for ID
  let idRegex = /^S[A-Z0-9]{8}$/;
  //regex for Hawaii Zip code that accounts for the 4 digit
  let zipRegex=/^(96[78]\d\d)(-(\d{4}))?$/;
  //regex for phone numbers with and without dashes.
  let phoneRegex=/^\d{3}-\d{3}-\d{4}$|^\d{10}$/;

  //Tests to see if input for state ID meets the requirements specified
  if (!idRegex.test(document.voterapp.idNum.value)) {
    alert("ID Number Error: Must start with an S followed by 8 uppercase letters or digits.");
    eventParam.preventDefault();
    return;
  }
  //The following 5 if/then blocks checks to make sure
  //the fields are not blank and allows the user
  //to go back and make any corrections if neccessary.
  if (document.voterapp.dob.value.length==0){
    alert("Error: Please enter your date of birth.");
    eventParam.preventDefault();
    return;
  }
  
  if (document.voterapp.lastname.value.length==0){
    alert("Error: Last name cannot be blank.");
    eventParam.preventDefault();
    return;
  }

  if (document.voterapp.firstname.value.length==0){
    alert("Error: First name cannot be blank.");
    eventParam.preventDefault();
    return;
  }

  if (document.voterapp.address1.value.length==0) {
    alert("Error: Address Line 1 cannot be blank");
    eventParam.preventDefault();
    return;
  }

  if (document.voterapp.city.value.length==0) {
    alert("Error: City cannot be blank.");
    eventParam.preventDefault();
    return;
  }
  //Validates the zip code field making sure it meets
  //the conditions of a Hawaii based zip code.
  if (!zipRegex.test(document.voterapp.zip.value)) {
    alert("Error: ZIP code is not a Hawaii ZIP code.");
    eventParam.preventDefault();
    return;
  }
  //Ensures the state input box is not blank.
  if (document.voterapp.state.value.length==0) {
    alert("Error: State cannot be blank.");
    eventParam.preventDefault();
    return;
  }
  
  //Checks to make sure the input meets the requirements
  //of a phone number with and without dashes. 
  if (!phoneRegex.test(document.voterapp.phone.value)){
    alert("Error: Please enter a phone number in the form 000-000-0000 or 0000000000.");
    eventParam.preventDefault();
    return;
  }
  //The following 3 blocks checks to make sure the user has not left
  //any of the check boxes blank
  if (document.voterapp.amCitizen.value.length == 0) {
    alert("Error: Please answer if you are a citizen of the United States of America");
    eventParam.preventDefault();
    return;
  }
  if (document.voterapp.ageToVote.value.length == 0) {
    alert("Error: Please answer if you are at least 16 years of age.");
    eventParam.preventDefault();
    return;
  }
  if (document.voterapp.amResident.value.length == 0) {
    alert("Error: Please answer if you are a resident of the State of Hawaii");
    eventParam.preventDefault();
    return;
  }
 
  //creates a list of elements that are of the input type radio
  let elementList = document.querySelectorAll('input[type="radio"]');
  
  //loops through each input and checks to see if "no" has been chosen
  for (let i = 0; i < elementList.length; i++) {
    //if a user has chosen no, he/she is not qualified to vote
    if (elementList[i].value=="no" && elementList[i].checked) {
      alert("Error: You do not qualify to register to vote.");
      eventParam.preventDefault();
      return; 
    }  
  }
  //Ensures the user has checked the affirmation box beofre the data can be submitted.
  if (!document.voterapp.affirm.checked) {
    alert("Please check the affirmation in Section III to submit your application.");
    eventParam.preventDefault();
    return;
  }
  //if the criteria has been met, the form will be submitted.
  alert("Thank You! Your application will be submitted.");
});

//if the user chooses to use the same resident address for mail, clicking
//the checkbox will automatically fill the following fields.
document.voterapp.useMailAddress.addEventListener("click", function() {

  if (document.voterapp.useMailAddress.checked) {
    document.voterapp.resAddress1.value = document.voterapp.address1.value;
    document.voterapp.resAddress2.value = document.voterapp.address2.value;
    document.voterapp.resCity.value = document.voterapp.city.value;
    document.voterapp.resState.value = document.voterapp.state.value;
    document.voterapp.resZip.value = document.voterapp.zip.value;
  } else {
    //clears the fields if unchecked.
    document.voterapp.resAddress1.value = "";
    document.voterapp.resAddress2.value = "";
    document.voterapp.resCity.value = "";
    document.voterapp.resState.value = "";
    document.voterapp.resZip.value = "";
  }
});