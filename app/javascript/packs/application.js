import "bootstrap";
// // import { myFunction } from '../trip_new.js.erb'

const bookingSlots =  document.querySelectorAll(".booking-slot-open");
const continueBtn = document.querySelector(".continue");


const timeArray = []

bookingSlots.forEach((element) => {
  element.addEventListener("click", () => {
    element.classList.toggle("booked");
    timeArray.push(element.dataset.timeslot);
    console.log(timeArray);
  })
  // To add toggle checkbox
});

const send = () => {
  $.ajax({
    url : "TripsCreate",
    type : "post",
    data : { data_value: JSON.stringify(timeArray) }
  });
  console.log("click");
};

continueBtn.addEventListener("click", send());

