require 'test_helper'

class HelloControllerTest < ActionDispatch::IntegrationTest
  test "list action" do
    get '/hello/list'
    assert_equal 'list', @controller.action_name
    assert_match /[0-9]+円/, @response.body
    assert_response :success, 'list action failed.'
  end

=begin
  test "routing check" do
    assert_generates('hello/view', { controller: 'hello', action: 'view' })
    # assert_recognizes({ controller: 'hello', action: 'view' }, 'hello/view')
  end
=end

=begin
  test "select check" do
    get '/hello/list'
    assert_select 'title'
    assert_select 'title', true
    assert_select 'font', false
    assert_select 'title', 'Railbook'
    assert_select 'table[class=?]', 'table'
    assert_select 'title', /[A-Za-z0-9]+/
    assert_select 'table tr', 11
    assert_select 'table' do
      assert_select 'tr', 1..11
    end
    assert_select 'title', { count: 1, text: 'Railbook' }
  end
=end
end
