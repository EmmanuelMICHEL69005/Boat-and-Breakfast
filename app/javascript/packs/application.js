import "bootstrap";
import flatpickr from "flatpickr"
import 'flatpickr/dist/flatpickr.min.css'
console.log(flatpickr)
console.log('mkjbljbijnoinibniuhbiuh')

flatpickr("#dateFin", {
  altInput: true,
    altFormat: "j F Y",
    dateFormat: "Y-m-d",
    minDate: "today"
});

flatpickr("#dateDebut", {
  altInput: true,
    altFormat: "j F Y",
    dateFormat: "Y-m-d",
    minDate: "today",

});
