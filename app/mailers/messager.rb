class Messager < ActionMailer::Base
  default from: "no-reply@mycardiopal.com"

  def invitation(user)
    @user = user
    mail to: user.email, subject: 'Please confirm your MyCardioPal account'
  end

  def reset_password(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset Instruction"
  end
end
