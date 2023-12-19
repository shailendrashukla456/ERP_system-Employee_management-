class Department < ApplicationRecord
    has_many :admin_users
    has_many :profiles
    validates :department_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "Only alphabets are allowed" }
end
