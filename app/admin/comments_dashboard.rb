ActiveAdmin.register Comment do
  index do
    column :body
    column :link
    column :user
    default_actions
  end

  form do
    f.inputs :body
    f.actions
  end
end
