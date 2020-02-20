const initBlur = () => {
  const blurElement = document.querySelector(".home-background");
  const input = document.querySelectorAll(".input-form");

  if (blurElement) {
    const setBlur = function() {
      blurElement.style.filter = "blur(4px)";
      blurElement.style.transition = "1s";
    };
    const unsetBlur = function() {
      blurElement.style.filter = "blur(0px)";
      blurElement.style.transition = "1s";
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

  }



}

export { initBlur };
