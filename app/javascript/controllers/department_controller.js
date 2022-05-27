import ApplicationController from './application_controller'

export default class extends ApplicationController {

  static targets = ['query','emp']

  search (event) {
    event.preventDefault()
    this.stimulate('DepartmentReflex#search', this.queryTarget.value)
  }

  employee_search (event) {
    event.preventDefault()
    this.stimulate('DepartmentReflex#employee_search', this.empTarget.value)
  }
  
  create(event) {
    event.preventDefault();
    this.stimulate("department#create");
  }
}
