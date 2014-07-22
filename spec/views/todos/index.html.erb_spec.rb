require 'rails_helper'

RSpec.describe "todos/index", :type => :view do
  before(:each) do
    assign(:todos, [
      Todo.create!(
        :user_id => 1,
        :task => "Task",
        :status => false
      ),
      Todo.create!(
        :user_id => 1,
        :task => "Task",
        :status => false
      )
    ])
  end

  it "renders a list of todos" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Task".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
