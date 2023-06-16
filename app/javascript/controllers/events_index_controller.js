import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['container'];

  connect() {
    console.log("The 'events' controller is now loaded!")
  }

  initialize() {
    this.loadPartial('city_events');
  }

  showPartialOne() {
    this.loadPartial('city_events');
  }

  showPartialTwo() {
    this.loadPartial('favorite_events');
  }

  loadPartial(partialName) {
    this.containerTarget.innerHTML = '<p>Loading...</p>';

    fetch(`/partials/${partialName}`)
      .then(response => response.text())
      .then(data => {
        this.containerTarget.innerHTML = data;
      });
  }

}
