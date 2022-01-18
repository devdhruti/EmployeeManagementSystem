import ApplicationController from './application_controller'

export default class extends ApplicationController {
  
  static targets = ['query']

  search (event) {
    event.preventDefault()
    this.stimulate('EmployeeReflex#search', this.queryTarget.value)
  }
}