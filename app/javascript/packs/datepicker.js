import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";

//Best practice: done this way to avoid overwrting from other javascript files
const datePickerHelper = {
  init: function() {
    flatpickr(".datepicker", {allowInput: true});
    const datefields = document.querySelectorAll(".datepicker");
    datefields.forEach(datefield => datefield.onpress = () => false);
  }
}

datePickerHelper.init()
