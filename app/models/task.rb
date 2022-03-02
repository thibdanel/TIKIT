class Task < ApplicationRecord
  belongs_to :user
  belongs_to :user_service, optional: true

end
