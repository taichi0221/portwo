import Typed from 'typed.js';

function post() {
  console.log("typed_js読み込み")
  const typed = new Typed('#typed', {
    stringsElement: '#typed-strings',
    typeSpeed: 15,
    backSpeed: 0,
    loop: false,
    contentType: 'html',
  });
};

document.addEventListener("turbolinks:load", post)