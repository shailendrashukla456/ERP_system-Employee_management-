ActiveAdmin.register StaffExperience do

 
   permit_params :total_experience, :certificate, :admin_user_id
  
   index do
    selectable_column
    id_column
    column :admin_user do |obj|
      admin_user = AdminUser.find_by(id: obj.admin_user_id)
      admin_user.email if admin_user
    end
    column :total_experience
    column :certificate
    actions
  end

  form do |f|
    f.inputs 'Staff Experience Details' do
      f.input :admin_user_id, as: :hidden, input_html: { value: current_admin_user.id }
      f.input :total_experience
    
    end
    f.actions
  end

end
