document.voterapp.addEventListener("submit", function(eventParam) {
  let idNumValue = document.voterapp.idNum.value;
  let idRegex = /^S[A-Z0-9]{8}$/;
  let zipRegex=/^(96[78]\d\d)(-(\d{4}))?$/;
  if (!idRegex.test(idNumValue)) {
    alert("ID Number Error: Must start with an S followed by 8 uppercase letters or digits.");
    eventParam.preventDefault();
    return;
  }

  if (document.voterapp.dob.value.length==0){
    alert("Error: Please enter your date of birth.");
    eventParam.preventDefault();
    return;
  }

  if (!zipRegex.test(document.voterapp.zip.value)) {
    alert("Error: ZIP code is not a Hawaii ZIP code.");
    eventParam.preventDefault();
    return;
  }
});