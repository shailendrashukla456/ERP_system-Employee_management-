ActiveAdmin.register LeaveType do
 
  menu label: 'LeaveType', if: proc { current_admin_user.role == 'admin' }

  
   permit_params :leave_type
  
  
end
