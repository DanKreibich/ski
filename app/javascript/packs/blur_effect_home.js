const blurElement = document.querySelector(".home-background");
const input = document.querySelectorAll(".input-form");


const setBlur = function() {
  blurElement.style.filter = "blur(4px)";
};
const unsetBlur = function() {
  blurElement.style.filter = "blur(0px)";
};

input[0].onfocus = function() {
    setBlur();
};
input[0].onblur = function() {
    unsetBlur();
};

input[1].onfocus = function() {
    setBlur();
};
input[1].onblur = function() {
    unsetBlur();
};

input[2].onfocus = function() {
    setBlur();
};
input[2].onblur = function() {
    unsetBlur();
};
