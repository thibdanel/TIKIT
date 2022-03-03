class UserService < ApplicationRecord
  belongs_to :service
  belongs_to :user
  has_many :tasks

  geocoded_by :contact_address
  after_validation :geocode, if: :will_save_change_to_contact_address?
end
