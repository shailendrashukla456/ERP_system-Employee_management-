class Profile < ApplicationRecord
  belongs_to :department
  belongs_to :admin_user
end
