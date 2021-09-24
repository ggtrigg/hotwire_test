import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  clear_input(event) {
    this.element.querySelector("input[type=text]").value = "";
  }
}