ActiveAdmin.register Profile do

  
  permit_params :name, :contact, :address, :department_id, :admin_user_id,
  educations_attributes: [:id, :admin_user_id, :qualification, :institute_name, :start_year, :end_year, :specialization],
  staff_experiences_attributes: [:id, :total_experience, :certificate, :admin_user_id]


  # actions :all, :except => [:new, :destroy]
  
  controller do
    
    before_action :check_existing_record, only: [:new]

    def scoped_collection
      end_of_association_chain.where(admin_user_id: current_admin_user.id)
    end

    private

    def check_existing_record
      if Profile.exists?(admin_user_id: current_admin_user.id)
        flash[:alert] = 'You can already add Profile, Please you ony update your profile.'
        redirect_to admin_profiles_path
      end
    end
  end


  index do
    selectable_column
    id_column
    column :staff do |obj|
      admin_user = AdminUser.find_by(id: obj.admin_user_id)
      admin_user.email if admin_user
    end
    column :department_id do |obj|
      department = Department.find_by(id: obj.department_id)
      department.department_name if department
    end
    column :name
    column :contact
    column :address
    actions
  end

  form do |f|
    f.inputs 'Profile Details' do
      f.input :name
      f.input :contact
      f.input :address
      f.input :department, as: :select, collection: Department.all.map { |d| [d.department_name, d.id] }
      f.input :admin_user, as: :select, collection: AdminUser.all.map { |u| [u.email, u.id] }

     
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :contact
      row :address
      row :department
      row :admin_user

      row 'Educations' do
        table_for current_admin_user.educations do
          column :qualification
          column :institute_name
          column :start_year
          column :end_year
          column :specialization
        end
      end

      row 'Staff Experiences' do
        table_for current_admin_user.staff_experiences do
          column :total_experience
          column :certificate
        end
      end
    end

  end

end
