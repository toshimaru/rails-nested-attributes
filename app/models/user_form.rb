class UserForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :email, :string
  
  attr_accessor :user, :todo_tasks

  def save
    self.user = User.new(attributes)
    # todo_tasks.reject(&:blank?).each do |task|
    todo_tasks.each do |task|
      self.user.todos << Todo.new(task: task)
    end
 
    if self.user.save
      true
    else
      binding.irb
      self.user.errors.each do |key, value|
        errors.add key, value
      end
      false
    end
  end
end
