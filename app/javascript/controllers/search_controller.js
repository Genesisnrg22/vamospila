import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"

export default class extends Controller {
  static targets = ["input", "suggestions"]
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

  search(event) {
    const address = event.target.value;
    const url = `/services/search?title=${encodeURIComponent(address)}`;
    console.log("URL de solicitud:", url);
    fetch(url)
      .then(response => response.json())
      .then(data => {
        this.suggestionsTarget.innerHTML = "";
        data.forEach(suggestion => {
          const suggestionElement = document.createElement("div");
          suggestionElement.textContent = suggestion;
          this.suggestionsTarget.appendChild(suggestionElement);
        });
      })
      .catch(error => console.error('Error:', error));
  }
}
