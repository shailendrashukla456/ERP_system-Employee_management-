class EmployeeType < ApplicationRecord
    
    validates :employee_type, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "Only alphabets are allowed" }

end
