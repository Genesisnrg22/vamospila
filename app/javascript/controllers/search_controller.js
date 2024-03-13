import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"

export default class extends Controller {
  static targets = ["input"]
  connect() {
    console.log("Hola desde search controller")
  }

  filter(event) {
    console.log("submit");
    event.preventDefault();
    const address = this.inputTarget.value;
    console.log(address);
    window.location.href = `/services?title=${encodeURIComponent(address)}`;
  }
}
