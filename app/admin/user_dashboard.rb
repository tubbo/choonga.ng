ActiveAdmin.register User do
  index do
    column :name
    default_actions
  end

  form do |f|
    f.inputs :name, :email, :password, :password_confirmation
    f.actions
  end

  controller do
    def permitted_params
      params.permit user: [:name, :email, :password, :password_confirmation]
    end
  end
end
