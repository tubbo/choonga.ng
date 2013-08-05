ActiveAdmin.register Service do
  index do
    column :name
    default_actions
  end

  form do
    f.input :name
    f.input :icon, as: :file_field
    f.input :embed_code, as: :text_area
    f.actions
  end
end
