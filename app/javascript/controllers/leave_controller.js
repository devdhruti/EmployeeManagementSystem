import ApplicationController from './application_controller'

export default class extends ApplicationController {
  
  static targets = ['first', 'last']

  start_date (event) {
    event.preventDefault()
    this.stimulate('LeaveReflex#start_date', this.firstTarget.value)
  }
  end_date (event) {
    event.preventDefault()
    this.stimulate('LeaveReflex#end_date', this.lastTarget.value)
  }
}