import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card"
export default class extends Controller {
  static targets = ["input", "visa", "mastercard"]
  connect() {
    console.log(this.element);
  }

  verification(){
    console.log(this.inputTarget.value[0]);
    if (this.inputTarget.value[0] == 4){
      console.log("Visa");
      this.visaTarget.classList.remove("d-none");
      this.mastercardTarget.classList.add("d-none");
    }else if (this.inputTarget.value[0] == 5){
      console.log("Mastercard");
      this.mastercardTarget.classList.remove("d-none");
      this.visaTarget.classList.add("d-none");
    }
    else {
      console.log("Unknown");
    }
  }
}
