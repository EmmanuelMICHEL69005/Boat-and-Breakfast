import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

import { initAutocomplete } from '../plugins/init_autocomplete.js';

initMapbox();
initAutocomplete()

import flatpickr from "flatpickr"
import 'flatpickr/dist/flatpickr.min.css'
console.log(flatpickr)
console.log('mkjbljbijnoinibniuhbiuh')

flatpickr("#dateFin", {
  altInput: true,
    altFormat: "j F Y",
    dateFormat: "Y-m-d",
    minDate: "today",
});

flatpickr("#dateDebut", {
  altInput: true,
    altFormat: "j F Y",
    dateFormat: "Y-m-d",
    minDate: "today",
});



querySelector('')
flatpickr(".beginbooking", {
  altInput: true,
    altFormat: "j F Y",
    dateFormat: "Y-m-d",
    minDate: "today",
});

flatpickr(".endbooking", {
  altInput: true,
    altFormat: "j F Y",
    dateFormat: "Y-m-d",
    minDate: "today",
});

