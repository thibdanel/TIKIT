class Service < ApplicationRecord
  has_many :service_tasks
  has_many :user_services
  has_one_attached :photo
end
