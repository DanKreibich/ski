import "bootstrap";
// importing function for autocomplete
import { autocompleteSearch } from "./autocomplete";
// // import { myFunction } from '../trip_new.js.erb'

// calling autocomplete function
autocompleteSearch();

const bookingSlots =  document.querySelectorAll(".booking-slot-open");
const continueBtn = document.querySelector(".continue");


const timeArray = []

bookingSlots.forEach((element) => {
  element.addEventListener("click", () => {
    element.classList.toggle("selected");
    timeArray.push(element.dataset.timeslot);
  })
  // To add toggle checkbox
});



// Grab pricing divs for dynamic price update

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


// WIP: attempt to push array of session.start to the controller

// const send = (e) => {
//   e.preventDefault()
//   fetch("/users/41/trips", {
//     method: "POST",
//     // body: { time: JSON.stringify(timeArray) }
//     body: JSON.stringify({first_name: "Ricky", last_name: "Bobby"}),
//     headers: {
//     'Content-Type': 'application/json',
//     'X-CSRF-Token': Rails.csrfToken()
//   },
//   })
//     .then(response => {
//       console.log('hi')
//       response.json()
//     })
//     .then((data) => {
//       return data; // Look at local_names.default
//     });
// };


// continueBtn.addEventListener("click", send);

