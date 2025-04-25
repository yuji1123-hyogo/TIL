require "application_system_test_case"

class FanCommentsTest < ApplicationSystemTestCase
=begin
  setup do
    @fan_comment = fan_comments(:one)
  end

  test "visiting the index" do
    visit fan_comments_url
    assert_selector "h1", text: "Fan comments"
  end

  test "should create fan comment" do
    visit fan_comments_url
    click_on "New fan comment"

    fill_in "Author no", with: @fan_comment.author_no
    fill_in "Body", with: @fan_comment.body
    check "Deleted" if @fan_comment.deleted
    fill_in "Name", with: @fan_comment.name
    click_on "Create Fan comment"

    assert_text "Fan comment was successfully created"
    click_on "Back"
  end

  test "should update Fan comment" do
    visit fan_comment_url(@fan_comment)
    click_on "Edit this fan comment", match: :first

    fill_in "Author no", with: @fan_comment.author_no
    fill_in "Body", with: @fan_comment.body
    check "Deleted" if @fan_comment.deleted
    fill_in "Name", with: @fan_comment.name
    click_on "Update Fan comment"

    assert_text "Fan comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Fan comment" do
    visit fan_comment_url(@fan_comment)
    click_on "Destroy this fan comment", match: :first

    assert_text "Fan comment was successfully destroyed"
  end
=end
end
