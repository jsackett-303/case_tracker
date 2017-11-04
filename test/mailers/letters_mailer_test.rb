require 'test_helper'

class LettersMailerTest < ActionMailer::TestCase
  test "initial_appearance" do
    l = Letter.create!(content: 'Hi CLIENT_FIRST_NAME', from: 'from@example.com', template: true, name: 'initial_appearance')
    c = Client.create!(email: 'to@example.org', first_name: 'Foo')

    mail = LettersMailer.call(l, c)
    assert_equal "Initial appearance", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi Foo", mail.body.encoded
  end

end
