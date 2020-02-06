const rating1 = document.getElementById("rating-1");
const rating2 = document.getElementById("rating-2");
const rating3 = document.getElementById("rating-3");
const rating4 = document.getElementById("rating-4");
const rating5 = document.getElementById("rating-5");

var arrayRating5 = [];
var arrayRating4 = [];
var arrayRating3 = [];
var arrayRating2 = [];
var arrayRating1 = [];

const cardsContainer = document.querySelector(".show-cards-container")
const allCards = document.querySelectorAll(".instructor-card");

const filterElements = function(element) {
  if (element.querySelector(".rating").innerText >= 4) {
    arrayRating5.push(element)
  } else if (element.querySelector(".rating").innerText >= 3) {
    arrayRating4.push(element)
  } else if (element.querySelector(".rating").innerText >= 2) {
    arrayRating3.push(element)
  } else if (element.querySelector(".rating").innerText >= 1) {
    arrayRating2.push(element)
  } else {
    arrayRating1.push(element)
  }
};

const initializeArray = function() {
  allCards.forEach((element) => {
    filterElements(element);
  })
};

initializeArray();

const clearPage = function(){
  cardsContainer.innerHTML = '';
}

const appendCards = function(array) {
  array.forEach((element) => {
    cardsContainer.append(element)
  })
};

rating1.onclick = function(){
  clearPage();
  appendCards(arrayRating1);
  rating1.classList.add("selected");
  rating2.classList.remove("selected");
  rating3.classList.remove("selected");
  rating4.classList.remove("selected");
  rating5.classList.remove("selected");
}
rating2.onclick = function(){
  clearPage();
  appendCards(arrayRating2);
  rating1.classList.remove("selected");
  rating2.classList.add("selected");
  rating3.classList.remove("selected");
  rating4.classList.remove("selected");
  rating5.classList.remove("selected");
}
rating3.onclick = function(){
  clearPage();
  appendCards(arrayRating3);
  rating1.classList.remove("selected");
  rating2.classList.remove("selected");
  rating3.classList.add("selected");
  rating4.classList.remove("selected");
  rating5.classList.remove("selected");
}
rating4.onclick = function(){
  clearPage();
  appendCards(arrayRating4);
  rating1.classList.remove("selected");
  rating2.classList.remove("selected");
  rating3.classList.remove("selected");
  rating4.classList.add("selected");
  rating5.classList.remove("selected");
}
rating5.onclick = function(){
  clearPage();
  appendCards(arrayRating5);
  rating1.classList.remove("selected");
  rating2.classList.remove("selected");
  rating3.classList.remove("selected");
  rating4.classList.remove("selected");
  rating5.classList.add("selected");
}

