require 'rails_helper'

RSpec.describe "todos/new", :type => :view do
  before(:each) do
    assign(:todo, Todo.new(
      :user_id => 1,
      :task => "MyString",
      :status => false
    ))
  end

  it "renders new todo form" do
    render

    assert_select "form[action=?][method=?]", todos_path, "post" do

      assert_select "input#todo_user_id[name=?]", "todo[user_id]"

      assert_select "input#todo_task[name=?]", "todo[task]"

      assert_select "input#todo_status[name=?]", "todo[status]"
    end
  end
end
