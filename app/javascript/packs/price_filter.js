import noUiSlider from "nouislider";

const initSlider = () => {
  const slider = document.getElementById('singleSlider');

  noUiSlider.create(slider, {
      start: [20, 80],
      connect: true,
      range: {
          'min': 0,
          'max': 100
      }
  });



}

export { initSlider };
