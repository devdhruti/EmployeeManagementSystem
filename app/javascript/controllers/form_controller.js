import ApplicationController from './application_controller'

export default class extends ApplicationController {
  
  reset (event) {
    event.preventDefault()
    Turbolinks.visit("/employees/new")
  }

  connect () {
    super.connect()
    // add your code here, if applicable
  }
}