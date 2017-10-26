require 'test_helper'

class LettersMailerTest < ActionMailer::TestCase
  test "welcome" do
    l = Letter.create!(content: 'Hi CLIENT_FIRST_NAME', from: 'from@example.com', template: true)
    c = Client.create!(email: 'to@example.org', first_name: 'Foo')

    mail = LettersMailer.welcome(l, c)
    assert_equal "Welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
