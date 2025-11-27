import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String,
    frameId: String
  }

  // Called when any radio with data-action="change->system-selector#changed" fires
  changed(event) {
    const system = event.target.value
    const fetchUrl = `${this.urlValue}?system=${encodeURIComponent(system)}`

    fetch(fetchUrl, { headers: { 'Accept': 'text/html' } })
      .then(response => {
        if (!response.ok) throw new Error('Network response was not ok')
        return response.text()
      })
      .then(html => {
        const frame = document.getElementById(this.frameIdValue)
        if (frame) {
          frame.innerHTML = html
        }
      })
      .catch(error => {
        // eslint-disable-next-line no-console
        console.error('Error fetching system preview:', error)
      })
  }
}
