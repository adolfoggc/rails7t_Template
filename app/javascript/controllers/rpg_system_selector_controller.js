import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  //these values were defined on the page that evokes this controller
  static values = {
    url: String,
    frameId: String
  }

  // Called when any radio with data-action="change->system-selector#changed" fires
  changed(event) {
    const rpg_system = event.target.value

    //fetchUrl receives an URL to request the partial using as param `rpg_system`
    const fetchUrl = `${this.urlValue}?rpg_system=${encodeURIComponent(rpg_system)}`

    //requests the partial
    fetch(fetchUrl, { headers: { 'Accept': 'text/html' } })
      .then(response => {
        //if fails to make a request, throw an error and leave the interaction
        if (!response.ok) throw new Error('Network response was not ok')
        return response.text()
      })
      .then(renderedPartial => {
        //renderedPartial is the response for that request, received by promise
        
        //aims the frame on `new` page
        const targetFrame = document.getElementById(this.frameIdValue)
        let json = {
          "frameIdValue": this.frameIdValue, 
          "frame": targetFrame
        }
        call_console(json)
        if (targetFrame) {
          //overrides the html inside the targetFrame, making the renderedPartial the frame html
          targetFrame.innerHTML = renderedPartial
        }
      })
      .catch(error => {
        // eslint-disable-next-line no-console
        console.error('Error fetching system preview:', error)
      })
  }
}

function call_console(jsonObject) {
  console.log('---------------------')
  for (let key in jsonObject) {
    console.log(`${key}: ${jsonObject[key]}`);
  }
  console.log('---------------------')
}

/*
Detailed notes about the `static values` block
- Purpose: `static values` declares *named values* the controller will accept from the DOM via `data-*` attributes.
- What Stimulus generates for each declared value:
  - a getter: `this.<name>Value` (e.g., `this.urlValue`, `this.frameIdValue`)
  - a presence checker: `this.has<Name>Value` (e.g., `this.hasUrlValue`)
  - if you define a method named `<name>ValueChanged(newValue, oldValue)`, Stimulus will call it when the value changes.
- HTML mapping:
  - For controller identifier `system-selector`, the attributes are:
    - `data-system-selector-url-value="some-string"` → `this.urlValue === "some-string"`
    - `data-system-selector-frame-id-value="dnd_frame"` → `this.frameIdValue === "dnd_frame"`
  - Note the attribute naming conventions: kebab-case in HTML → camelCase in JS.
- Types:
  - You used `String`: Stimulus uses these constructors to perform basic conversion/validation when reading values. Other allowed types include `Number`, `Boolean`, `Array`, `Object`, etc.
- Why it's convenient:
  - Keeps configuration in HTML rather than hardcoding values in JS.
  - Allows the same controller to be reused with different URLs or target frame IDs.

Extra helpful note (potential bug to watch)
- The controller sends `?rpg_system=...` (line 12). In the earlier server-side code I added, the controller action looked for `params[:system]` (not `:rpg_system`). If you find that nothing is happening server-side, make the parameter name consistent:
  - Either change the fetch to `?system=...`:
    - ``const fetchUrl = `${this.urlValue}?system=${encodeURIComponent(rpg_system)}```
  - Or change your Rails action to read `params[:rpg_system]`.
- Also ensure the HTML includes the expected `data-*` values, for example:
  - `data-controller="system-selector"`
  - `data-system-selector-url-value="<%= sheet_system_preview_path %>"`
  - `data-system-selector-frame-id-value="dnd_frame"`
*/
