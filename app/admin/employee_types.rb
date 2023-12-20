ActiveAdmin.register EmployeeType do


  menu label: 'EmployeeType', if: proc { current_admin_user.role == 'admin' }

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :employee_type
  #
  # or
  #
  # permit_params do
  #   permitted = [:employee_type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
