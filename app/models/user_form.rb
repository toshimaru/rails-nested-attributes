class UserForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :email, :string
  
  attr_accessor :user, :todo_tasks
  
  validates :name, presence: true
  validates :email, presence: true

  # Yet another error implementation pattern
  # delegate :errors, to: :user, allow_nil: true, prefix: true

  def save
    todos = todo_tasks.reject(&:blank?).map { |task| Todo.new(task: task) }
    self.user = User.new(attributes.merge(todos: todos))
 
    if self.user.save
      true
    else
      false
    end
  end
end
