import flatpickr from "flatpickr";

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ ]

  connect() {
    console.log("hello");
    flatpickr(".datepicker", {
      altInput: true
    });

  }
}
