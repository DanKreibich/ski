import "bootstrap";
// import { myFunction } from '../trip_new.js.erb'

const bookingSlots =  document.querySelectorAll(".booking-slot-open");

bookingSlots.forEach((element) => {
 element.addEventListener("click", () =>
    element.classList.toggle("booked"));
    checkbox.checked = !checkbox.checked
 // To add toggle checkbox
});
