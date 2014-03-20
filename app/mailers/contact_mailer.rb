class ContactMailer < ActionMailer::Base
  default from: "Vou Viajar Turismo <cristheinz@gmail.com>"
  
  def contact_email(visitor)
    @name=visitor[:name]
    @message=visitor[:message]
    @email=visitor[:email]
    mail(to: "Vou Viajar Turismo <vouviajarturismo@gmail.com>", subject: "Contato")
  end

  #este nao esta a ser usado.
  def feedback_email(visitor)
    @name=visitor[:name]
    mail(to: visitor[:email], subject: "Contato")
  end

end
