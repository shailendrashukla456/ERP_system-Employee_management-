ActiveAdmin.register StaffExperience do
  
  menu priority: 0, label: 'Staff_Experience', if: proc { current_admin_user.role == 'staff' }

   permit_params :total_experience, :certificate, :admin_user_id
   
   controller do
    
    before_action :check_existing_record, only: [:new]

    def scoped_collection
      end_of_association_chain.where(admin_user_id: current_admin_user.id)
    end

    private

    def check_existing_record
      if StaffExperience.exists?(admin_user_id: current_admin_user.id)
        flash[:alert] = 'You can already insert Staff Experience record.'
        redirect_to admin_staff_experiences_path
      end
    end
  end

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
