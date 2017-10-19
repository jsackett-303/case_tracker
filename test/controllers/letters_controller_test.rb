require 'test_helper'

class LettersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @letter = letters(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get letters_url
    assert_response :success
  end

  test "should get new" do
    get new_letter_url
    assert_response :success
  end

  test "should create letter" do
    assert_difference('Letter.count') do
      post letters_url, params: { letter: { bcc: @letter.bcc, cc: @letter.cc, content: @letter.content, email: @letter.email, from: @letter.from, sent: @letter.sent, template: @letter.template, to: @letter.to } }
    end

    assert_redirected_to letter_url(Letter.last)
  end

  test "should show letter" do
    get letter_url(@letter)
    assert_response :success
  end

  test "should get edit" do
    get edit_letter_url(@letter)
    assert_response :success
  end

  test "should update letter" do
    patch letter_url(@letter), params: { letter: { bcc: @letter.bcc, cc: @letter.cc, content: @letter.content, email: @letter.email, from: @letter.from, sent: @letter.sent, template: @letter.template, to: @letter.to } }
    assert_redirected_to letter_url(@letter)
  end

  test "should destroy letter" do
    assert_difference('Letter.count', -1) do
      delete letter_url(@letter)
    end

    assert_redirected_to letters_url
  end
end
