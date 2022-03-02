class UserService < ApplicationRecord
  belongs_to :service
  belongs_to :user
  has_many :tasks
end
