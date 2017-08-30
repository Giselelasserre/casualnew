class UserMailerPreview < ActionMailer::Preview
  def welcome
    # user = User.first
    UserMailer.welcome(@user)
  end

  def contactus
    # user = User.first
    UserMailer.contactus(@user)
  end

end
