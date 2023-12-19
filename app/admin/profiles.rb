ActiveAdmin.register Profile do

  
  permit_params :name, :contact, :address, :department_id, :admin_user_id,
  educations_attributes: [:id, :admin_user_id, :qualification, :institute_name, :start_year, :end_year, :specialization],
  staff_experiences_attributes: [:id, :total_experience, :certificate, :admin_user_id]


  actions :all, :except => [:new, :destroy]


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

  # form do |f|
  #   f.inputs 'Your Model Details' do
  #     f.input :name
  #     f.input :contact
  #     f.input :address
  #     f.input :department
  #     f.input :admin_user

  #     f.has_many :educations, allow_destroy: true, heading: 'Educations' do |education|
  #       education.input :qualification
  #       education.input :institute_name
  #       education.input :start_year
  #       education.input :end_year
  #       education.input :specialization
  #     end

  #     f.has_many :staff_experiences, allow_destroy: true, heading: 'Staff Experiences' do |experience|
  #       experience.input :total_experience
  #       experience.input :certificate
  #     end
  #   end

  #   f.actions
  # end

  
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
