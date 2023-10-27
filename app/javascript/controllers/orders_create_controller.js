import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="orders-create"
export default class extends Controller {
  static targets = ["orderElement"]
  connect() {
  }
  fire() {
    this.orderElementTarget.classList.toggle("d-none");
    }
}
