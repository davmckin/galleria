class UserMailer < ApplicationMailer

  def signup(user)
    @user = user
    mail(to: 'chris@chrisvannoy.com', subject: "I'm not tired, you're tired")
  end

  def share(album, email)
   @album = album
   mail(to: email, subject: "Check out this...thing")
  end

end
