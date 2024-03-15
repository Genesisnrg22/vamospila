import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scrollnavbar"
export default class extends Controller {
  static targets = ["navbar"]
  connect() {
    console.log("Hola estoy desde la navbar")
  }

  changeColor(){
    const resolution = window.screen.width
    let lastScrollTop = 0;
    const delta = 1;
    const currentScrollTop = window.scrollY;
    if (currentScrollTop == 0){
      this.navbarTarget.classList.remove("navbar-top-remove")
      this.navbarTarget.classList.add("navbar-top-add")
    } else {
      this.navbarTarget.classList.remove("navbar-top-add")
      this.navbarTarget.classList.add("navbar-top-remove")
    }
  //   if (currentScrollTop > lastScrollTop && currentScrollTop > window.innerHeight * 0.8) {
   }
}
