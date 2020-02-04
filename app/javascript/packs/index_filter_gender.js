const arrayAnyCards = [];
const arrayMaleCards = [];
const arrayFemaleCards = [];

var anyFilter = document.getElementById("any");
var maleFilter = document.getElementById("male");
var femaleFilter = document.getElementById("female");

var cardsContainer = document.querySelector(".show-cards-container");
var allCards = document.querySelectorAll(".instructor-card");



allCards.forEach((element) => {
    arrayAnyCards.push(element);
  if (element.dataset.gender === "Male"){
    arrayMaleCards.push(element);
  } else if (element.dataset.gender === "Female"){
    arrayFemaleCards.push(element);
  }
});

var clearBody = () => {
  allCards.forEach((element) => {
    element.remove();
  })
};

var appendCardsOnBody = (elements) => {
  elements.forEach((e) => {
    cardsContainer.appendChild(e);
  })
};

anyFilter.onclick =function() {
  clearBody();
  appendCardsOnBody(arrayAnyCards);
  anyFilter.classList.add("selected");
  maleFilter.classList.remove("selected");
  femaleFilter.classList.remove("selected");
};

maleFilter.onclick = function() {
  clearBody();
  appendCardsOnBody(arrayMaleCards);
  anyFilter.classList.remove("selected");
  maleFilter.classList.add("selected");
  femaleFilter.classList.remove("selected");
};

femaleFilter.onclick = function() {
  clearBody();
  appendCardsOnBody(arrayFemaleCards);
  anyFilter.classList.remove("selected");
  maleFilter.classList.remove("selected");
  femaleFilter.classList.add("selected");
};
