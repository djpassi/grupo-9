class ExampleMailer < ActionMailer::Base
  default from: "Quick Starter UC"

  def sample_email(user)
    mail(subject: 'Sample Email',to: user.email)
  end

  def register_email(user)
    @user = user
    mail(subject: 'Welcome to Quick Starter UC',to: @user.email)
  end

   def donation_email_investor(investor, project, investment)
     @investor = investor
     @project = project
     @investment = investment
     mail(subject: 'Thanks for donating in '+@project.name,to: @investor.email)
   end

   def donation_email_owner(owner, project, investment)
     @owner = owner
     @project = project
     @investment = investment
     mail(subject: 'Hey! You have a new donation for '+@project.name,to: @owner.email)
   end
end
