import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form", "input"]
  connect() {
  }
  send(event) {
    event.preventDefault();
    console.log("estou entrando no stimulus")

    fetch(this.formTarget.action, {
      method: "POST", // Could be dynamic with Stimulus values
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => {
        console.log(response)
        return response.json()
      })
      .then((data) => {
        console.log(data)
        if (data.inserted_item) {
          // beforeend could also be dynamic with Stimulus values
          this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        this.inputTarget.value = ""
      })
    }
}
