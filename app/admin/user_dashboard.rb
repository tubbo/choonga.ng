ActiveAdmin.register User do
  index do
    column :name
    default_actions
  end

  form do |f|
    f.inputs :name, :password, :password_confirmation
    f.actions
  end
end
