import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox"
export default class extends Controller {
  connect() {
    this.checkbox = this.element.querySelector('input[type="checkbox"]');
    const id = this.checkbox.getAttribute('data-id');
    this.checkbox.checked = localStorage.getItem(`checkboxState_${id}`) === 'true';

    this.checkbox.addEventListener('change', () => {
      localStorage.setItem(`checkboxState_${id}`, this.checkbox.checked);
    });
  }
}