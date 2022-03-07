class ServiceTask < ApplicationRecord
  belongs_to :service
  belongs_to :user_service, optional: true
end
