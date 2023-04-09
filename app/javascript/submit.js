function post (){
  console.log("submit_js読み込み")
  const submit = document.getElementById("submit");
    submit.addEventListener("click", () => {
    console.log("movieスタート")
    const after_submit = document.getElementById("after_submit")
    after_submit.setAttribute("style", "display:none;")
    const before_submit = document.getElementById("before_submit")
    before_submit.setAttribute("style", "display:block;")
    const before_submit2 = document.getElementById("before_submit2")
    before_submit2.setAttribute("style", "display:block;")
  });
};
 
document.addEventListener("turbolinks:load", post)
