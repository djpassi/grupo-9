class ExampleMailer < ActionMailer::Base
  default from: "davidgalemiri@gmail.com"

  def sample_email(user)
    @user = user
    mail(subject: 'Sample Email',to: "dagalemiri@uc.cl")
  end

end