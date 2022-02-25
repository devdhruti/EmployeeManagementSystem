class SendMailWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(employee_mail, name, leave)
    EmployeeMailer.leave_mail(employee_mail, name, leave).deliver
  end
end
