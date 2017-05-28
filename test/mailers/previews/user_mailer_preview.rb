# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class userMailerPreview < ActionMailer::Preview
  def new_user_email
    userMailer.new_user_email(User.first)
  end
  def new_seguidor_email
    userMailer.new_user_email(Team.first, User.first)
  end
end