import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['time']
  connect() {
    this.timeTarget.value = this.formatTime(new Date());
  }

  formatTime(date) {
    let hours = date.getHours().toString();
    hours = hours.length > 1 ? hours : '0' + hours;

    let minutes = date.getMinutes().toString();
    minutes = minutes.length > 1 ? minutes : '0' + minutes;

    return `${date.getHours()}:${date.getMinutes()}`;
  }
}
