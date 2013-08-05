ActiveAdmin.register Tag do
  index do
    column :name
    default_actions
  end

  form do
    f.input :name
    f.actions
  end
end
