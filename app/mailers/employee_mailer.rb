class EmployeeMailer < ApplicationMailer
  
    default from: 'dhruti3699@gmail.com'
    layout 'mailer'
    
    def leave_mail(notifier_email, name, leave)
      @name = name
      @leave = leave
      mail( to: notifier_email,
      subject: 'Leave request')
    end
  end
