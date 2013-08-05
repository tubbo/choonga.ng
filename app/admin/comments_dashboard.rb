ActiveAdmin.register Comment do
  index do
    column :body
    column :link
    column :user
    default_actions
  end

  form do |f|
    f.inputs :body, :link, :user
    f.actions
  end
end
