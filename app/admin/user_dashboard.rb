ActiveAdmin.register User do
  index do
    column :name
    default_actions
  end

  form do
    f.inputs :name
    f.actions
  end
end
