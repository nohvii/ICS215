/**
 * Validates the inputs from the birthday form. Alerts the user if there is something wrong with the form.
 * The form has these validations:
 *   1) The name is not blank, starts with a letter and contains only letters and spaces.
 *   2) A gender is chosen.
 *   3) A color is selected or typed in.
 *
 * Error messages are presented to the user in an alert.
 * Presents the user with 1 error at a time even if there are multiple errors present.
 * The form does not submit unless all the validations are passed.
 *
 * @author Ed Meyer
 */

// Validates the form when the user clicks on the submit button.
document.inviteForm.addEventListener("submit", function(eventParam) {

  // What the user typed for the name.
  let inputNameValue = document.inviteForm.inputName.value;
  // For the name, ensure it starts with a letter and contains only letters and spaces.
  let nameRegex = /^[a-z][a-z ]+$/i;
  // Ensure there is something in the name field.
  if (inputNameValue.length == 0) {
    alert("Please enter your name.");
    eventParam.preventDefault();
    return;
  }
  // Ensure the name starts with a letter and contains only letters and spaces.
  else if (!nameRegex.test(inputNameValue)) {
    alert("Name can only contain letters and spaces.");
    eventParam.preventDefault();
    return;
  }

  // Ensure a gender was chosen.
  let genderValue = document.inviteForm.gender.value;
  if (genderValue.length == 0) {
    alert("Please choose a gender.");
    eventParam.preventDefault();
    return;
  }

  /*
   * An alternative way to validate a gender was chosen.
   * Since there are two radio inputs with the name "gender" each radio is handled in array context.
   * [0] represents male
   * [1] represents female
   * The array is populated in the order that it is written in HTML.
   *   <input type="radio" name="gender" value="male"> Male
   *   <input type="radio" name="gender" value="female"> Female
   */
  //let genderElements = document.inviteForm.gender;
  // If both are unchecked, then the user didn't select a gender.
  //if (!genderElements[0].checked && !genderElements[1].checked) {
  //
  //}

  // Validate the user either selected a color or typed one in.
  let colorSelectValue = document.inviteForm.colorChoice.value;
  let otherColorValue = document.inviteForm.otherColor.value;

  // If the user left the color select field on "Select One"
  if (colorSelectValue == 0) {
    alert("Please choose a color.");
    eventParam.preventDefault();
    return;
  }
  // If the user chose "Other" in the select field, but left the Other color text input blank.
  else if (colorSelectValue == -1 && otherColorValue.length == 0) {
    alert("Please enter a color.");
    eventParam.preventDefault();
    return;
  }

  // Ready to party!
  // If code reaches down here, then there was nothing wrong with the input.
  alert("Thank you!! I'll see you at the party!!");
});

