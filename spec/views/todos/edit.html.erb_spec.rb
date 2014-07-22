require 'rails_helper'

RSpec.describe "todos/edit", :type => :view do
  before(:each) do
    @todo = assign(:todo, Todo.create!(
      :user_id => 1,
      :task => "MyString",
      :status => false
    ))
  end

  it "renders the edit todo form" do
    render

    assert_select "form[action=?][method=?]", todo_path(@todo), "post" do

      assert_select "input#todo_user_id[name=?]", "todo[user_id]"

      assert_select "input#todo_task[name=?]", "todo[task]"

      assert_select "input#todo_status[name=?]", "todo[status]"
    end
  end
end
