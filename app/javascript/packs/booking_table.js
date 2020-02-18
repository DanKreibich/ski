const bookingSlots =  document.querySelectorAll(".booking-slot-open");
bookingSlots.forEach(element => {
  element.addEventListener("click", () => {
    element.classList.toggle("selected");
    var checkbox = element.querySelector("input");
    checkbox.checked = !checkbox.checked;
  })
});


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
});


// Make full day button click/unclick all cells of a given day

const fullDayButtons = document.querySelectorAll("[data-type='select-day']");

fullDayButtons.forEach(button => {
  button.addEventListener("click", () => {
    const dayNumber = button.dataset.dayNumber;
    const divsForDay = document.querySelectorAll(`div[data-day-number='${dayNumber}']`);
    if (!button.classList.contains('btn-selected')) {
      button.classList.toggle("btn-selected");
      divsForDay.forEach(div => {
      if (!div.classList.contains('selected')){
        div.click();
      }
    })
    } else {
      divsForDay.forEach(div => {
        if (div.classList.contains('selected')){
          div.click();
          button.classList.remove("btn-selected");
        }
      })
    }
    // button.classList.toggle("btn-selected");
    // divsForDay.forEach(div => {
    //   if (!div.classList.contains('selected')){
    //     div.click();
    //   } else {
    //   }
    // })
  })
});

const btnTimeSlot = document.querySelectorAll('.selected');
btnTimeSlot.forEach((button) => {

    console.log(btnTimeSlot)
    button.addEventListener("click", ()  => {
      const dayOfWeek = event.currentTarget.dataset.dayNumber;
      console.log("hi")
      console.log(dayOfWeek)
      const btnAllDay = document.querySelector(`div[data-day-number='${dayNumber}']`).querySelector('.btn-selected');
      console.log("buy")
      console.log(btnAllDay)
      btnAllDay.classList.remove("btn-selected");
    })
})
