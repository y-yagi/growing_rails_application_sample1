# Preview all emails at http://localhost:3000/rails/mailers/account_mailer
class AccountMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/account_mailer/account_merge_notification
  def account_merge_notification
    AccountMailer.account_merge_notification
  end

end
