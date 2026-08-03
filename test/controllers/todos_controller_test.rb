require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = Todo.create!(title: "테스트 할 일", content: "테스트 내용", priority: :high, due_date: Date.tomorrow)
  end

  test "should get index" do
    get todos_url
    assert_response :success
  end

  test "should create todo" do
    assert_difference("Todo.count") do
      post todos_url, params: { todo: { title: "새로운 할 일", content: "내용", priority: "medium", due_date: Date.today } }
    end

    assert_redirected_to todos_path
  end

  test "should toggle todo completed status" do
    assert_equal false, @todo.completed

    patch toggle_todo_url(@todo)
    @todo.reload

    assert_equal true, @todo.completed
  end

  test "should destroy todo" do
    assert_difference("Todo.count", -1) do
      delete todo_url(@todo)
    end

    assert_redirected_to todos_path
  end
end
