import "bootstrap";
// // import { myFunction } from '../trip_new.js.erb'


import { autocompleteSearch } from './autocomplete';
import { setBookingSlot } from './booking_table';
import { initFlatpicker } from './datepicker';
import { initBlur } from './blur_effect_home';
import { initIndexFilter } from './index_filter_gender';
import { initRating } from './select_rating';

autocompleteSearch();
setBookingSlot();
initFlatpicker();
initBlur();
initIndexFilter();
initRating();

