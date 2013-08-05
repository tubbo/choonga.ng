ActiveAdmin.register Tag do
  index do
    column :name
    default_actions
  end

  form do |f|
    f.input :name
    f.actions
  end

  controller do
    def permitted_params
      params.permit tag: [:name]
    end
  end
end
