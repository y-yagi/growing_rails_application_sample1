require 'test_helper'

class AccountMailerTest < ActionMailer::TestCase
  test "account_merge_notification" do
    mail = AccountMailer.account_merge_notification
    assert_equal "Account merge notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
