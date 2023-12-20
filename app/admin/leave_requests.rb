ActiveAdmin.register LeaveRequest do
  permit_params :leave_type_id, :from, :to, :approve

  form do |f|
    f.inputs 'Leave Request Details' do
      f.input :leave_type, as: :select, collection: LeaveType.all.map { |a| [a.leave_type, a.id] }
      f.input :from
      f.input :to
      f.input :approve
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :leave_type_id
      row :from
      row :to
      row :approve
    end
  end

  index do
    selectable_column
    id_column
    column :leave_type_id do |leave_request|
      LeaveType.find(leave_request.leave_type_id).leave_type
    end
    column :from
    column :to
    column :approve
    actions
  end

  controller do
    before_action :check_admin, only: [:update]

    private

    def check_admin
      unless current_admin_user.admin?
        flash[:alert] = 'You do not have permission to approve leave requests.'
        redirect_to admin_leave_requests_path
      end
    end
  end

  member_action :approve, method: :put do
    if !resource.approve
      resource.update(approve: true)
      redirect_to admin_leave_requests_path, notice: 'Leave request approved.'
    else
      flash[:alert] = 'Leave request has already been approved.'
      redirect_to admin_leave_requests_path
    end
  end
  
end