ActiveAdmin.register Link do
  index do
    column :title
    column :url
    column :user
    default_actions
  end

  form do |f|
    f.inputs :title, :url
    f.actions
  end
end
