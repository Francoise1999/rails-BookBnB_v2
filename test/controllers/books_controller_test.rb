require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new_book" do
    get books_new_book_url
    assert_response :success
  end
end
