import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "border" ]

  connect() {
    console.log(this.inputTarget)
  }

  changeColor() {
    this.borderTarget.style.backgroundColor = this.inputTarget.value;
    console.log(this.inputTarget.value);
  }
}
