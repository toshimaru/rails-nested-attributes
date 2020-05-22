class Todo < ActiveRecord::Base
  belongs_to :user

  validates :task, presence: true
end
