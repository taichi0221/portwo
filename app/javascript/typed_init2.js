import Typed from 'typed.js';

function post() {
  console.log("typed_js読み込み")
  const submit = document.getElementById("submit");
    submit.addEventListener("click", () => {
    const typed = new Typed('#typed2', {
    stringsElement: '#typed-strings2',
    typeSpeed: 100,
    backSpeed: 0,
    loop: false,
    contentType: 'html',
  });
});
};


document.addEventListener("turbolinks:load", post)