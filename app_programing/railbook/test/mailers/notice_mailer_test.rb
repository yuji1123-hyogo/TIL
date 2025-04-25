require "test_helper"

class NoticeMailerTest < ActionMailer::TestCase
  test "sendmail_confirm" do
    user = User.find(6)
    mail = NoticeMailer.with(user: user).sendmail_confirm.deliver_now
    assert !ActionMailer::Base.deliveries.empty?
    assert_equal "nkakeyaさん、登録ありがとうございました", mail.subject
    assert_equal "nkakeya@example.com", mail.to[0]
    assert_equal "webmaster@example.com", mail.from[0]
    assert_equal read_fixture('sendmail_confirm').join, mail.body.to_s.gsub(/\R/, "\n")
  end
end
