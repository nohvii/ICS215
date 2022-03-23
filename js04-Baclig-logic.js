document.voterapp.addEventListener("submit", function(eventParam) {
  let idNumValue = document.voterapp.idNum.value;
  let idRegex = /^S[A-Z0-9]{8}$/;
  let zipRegex=/^(96[78]\d\d)(-(\d{4}))?$/;
  let phoneRegex=/^\d{3}-\d{3}-\d{4}$|^\d{10}$/;
 /*  if (!idRegex.test(idNumValue)) {
    alert("ID Number Error: Must start with an S followed by 8 uppercase letters or digits.");
    eventParam.preventDefault();
    return;
  }

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

  if (!zipRegex.test(document.voterapp.zip.value)) {
    alert("Error: ZIP code is not a Hawaii ZIP code.");
    eventParam.preventDefault();
    return;
  }

  if (document.voterapp.state.value.length==0) {
    alert("Error: State cannot be blank.");
    eventParam.preventDefault();
    return;
  }

  if (!phoneRegex.test(document.voterapp.phone.value)){
    alert("Error: Please enter a phone number in the form 000-000-0000 or 0000000000.");
    eventParam.preventDefault();
    return;
  }
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
  */

  let elementList = document.querySelectorAll('input[type="radio"]');
  
  for (let i = 0; i < elementList.length; i++) {
    if (elementList[i].value=="no" && elementList[i].checked) {
      alert("Error: You do not qualify to register to vote.");
      eventParam.preventDefault();
      return; 
    }  
  }

  if (!document.voterapp.affirm.checked) {
    alert("Please check the affirmation in Section III to submit your application.");
    eventParam.preventDefault();
    return;
  }
  
  alert("Thank You! Your application will be submitted.");
});

document.voterapp.useMailAddress.addEventListener("click", function() {

  if (document.voterapp.useMailAddress.checked) {
    document.voterapp.resAddress1.value = document.voterapp.address1.value;
    document.voterapp.resAddress2.value = document.voterapp.address2.value;
    document.voterapp.resCity.value = document.voterapp.city.value;
    document.voterapp.resState.value = document.voterapp.state.value;
    document.voterapp.resZip.value = document.voterapp.zip.value;
  } else {
    document.voterapp.resAddress1.value = "";
    document.voterapp.resAddress2.value = "";
    document.voterapp.resCity.value = "";
    document.voterapp.resState.value = "";
    document.voterapp.resZip.value = "";
  }
});