ActiveAdmin.register Service do
  index do
    column :name
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :icon, as: :file
      f.input :embed_code, as: :text
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit :service => [:name, :icon, :embed_code]
    end
  end
end
