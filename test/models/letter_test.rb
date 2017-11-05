require 'test_helper'

class LetterTest < ActiveSupport::TestCase
  test "#client_template?" do
    l = Letter.new(name: 'foo')
    refute l.client_template?

    l = Letter.new(name: 'initial_appearance')
    assert l.client_template?
  end
end
