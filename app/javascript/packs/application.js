import "bootstrap";
// importing function for autocomplete
import { autocompleteSearch } from "./autocomplete";
// // import { myFunction } from '../trip_new.js.erb'
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";

flatpickr(".datepicker", {});


// calling autocomplete function
// autocompleteSearch();

const bookingSlots =  document.querySelectorAll(".booking-slot-open");

bookingSlots.forEach(element => {
  element.addEventListener("click", () => {
    element.classList.toggle("selected");
    var checkbox = element.querySelector("input");
    console.log(checkbox);
    checkbox.checked = !checkbox.checked;
  })
})


// // Grab pricing divs for dynamic price update

const totalPrice = document.querySelector(".total-price");
const bookingNumSessions = document.querySelector(".booking-num-sessions");
const sessionPrice = document.querySelector(".session-price");


bookingSlots.forEach((e) => {
  e.addEventListener("click", () => {
    const selectedSessions = document.querySelectorAll(".selected")
    bookingNumSessions.innerText =  selectedSessions.length;
    totalPrice.innerText = parseInt(bookingNumSessions.innerText, 10)
    * parseInt(sessionPrice.innerText, 10);
  });
});

var form = document.querySelector("form");
form.addEventListener("submit", (event) => {
  event.preventDefault();
  // Update hidden field with price and student_id (to check)
  form.submit();
})
