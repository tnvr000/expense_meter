import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['date'];
  connect() {
    if(this.dateTarget.value) return;

    this.dateTarget.value = this.formatDate(new Date());
  }

  formatDate(date) {
    let month = date.getMonth().toString();
    month = month.length > 1 ? month : '0' + month;

    let day = date.getDate().toString();
    day = day.length > 1 ? day : '0' + day;

    return `${date.getFullYear()}-${month}-${day}`;
  }
}
