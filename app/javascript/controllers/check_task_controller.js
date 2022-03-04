import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form" ]

  connect() {
    console.log("hello!")
  }



  next(event) {
    this.formTarget.submit();
  }
}
