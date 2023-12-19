ActiveAdmin.register Education do

  
  permit_params :admin_user_id, :qualification, :institute_name, :start_year, :end_year, :specialization
 

  index do
    selectable_column
    id_column
    column :staff do |obj|
      admin_user = AdminUser.find_by(id: obj.admin_user_id)
      admin_user.email if admin_user
    end
   
    column :qualification
    column :institute_name
    column :start_year
    column :end_year
    column :specialization
    actions
  end

  form do |f|
    f.inputs 'Education Details' do
      f.input :admin_user_id, as: :hidden, input_html: { value: current_admin_user.id }
      f.input :qualification
      f.input :institute_name
      f.input :start_year
      f.input :end_year
      f.input :specialization
    end
    f.actions
  end

end
