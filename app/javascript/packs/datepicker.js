import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";

const initFlatpicker = () => {
  //Best practice: done this way to avoid overwrting from other javascript files
  const datePickerHelper = {
    init: function() {
      //added altInput to show date in better format
      flatpickr(".datepicker", {
        allowInput: true,
        minDate: new Date(),
        dateFormat: "F, J Y",
      });
      const datefields = document.querySelectorAll(".datepicker");
      datefields.forEach(datefield => datefield.onpress = () => false);
    }
  }

  datePickerHelper.init()

}


export { initFlatpicker };
