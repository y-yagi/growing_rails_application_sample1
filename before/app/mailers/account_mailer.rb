class AccountMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_mailer.account_merge_notification.subject
  #
  def account_merge_notification(source, target)
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
