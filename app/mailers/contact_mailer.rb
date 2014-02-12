class ContactMailer < ActionMailer::Base
  default from: "Vou Viajar Turismo <vouviajarturismo@gmail.com>"
  
  def contact_email(visitor)
    @name=visitor[:name]
    @message=visitor[:message]
    mail(from: visitor[:email], to: "vouviajarturismo@gmail.com", subject: "Contato")
  end

  def feedback_email(visitor)
    @name=visitor[:name]
    mail(to: visitor[:email], subject: "Contato")
  end

end
