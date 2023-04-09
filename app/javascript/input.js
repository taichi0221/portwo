function post (){
  console.log("input_js読み込み")

const languageInput = document.getElementById("language_input");
const frameworkInput = document.getElementById("framework_input");
const hobbyInput = document.getElementById("hobby_input");
const desired_engineerInput = document.getElementById("desired_engineer_input");
const submit = document.getElementById("submit");
const checkInputs = function() {
    if (languageInput.value.length > 0 &&
      frameworkInput.value.length > 0 &&
      hobbyInput.value.length > 0 &&
      desired_engineerInput.value.length > 0) {
    submit.style.display = "block";
  } else {
    submit.style.display = "none";
  }
};
languageInput.addEventListener("input", checkInputs);
frameworkInput.addEventListener("input", checkInputs);
hobbyInput.addEventListener("input", checkInputs);
desired_engineerInput.addEventListener("input", checkInputs);
};

document.addEventListener("turbolinks:load", post)
