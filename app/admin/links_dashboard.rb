ActiveAdmin.register Link do
  index do
    column :title
    column :url
    column :user
    default_actions
  end

  form do |f|
    f.inputs :title, :url, :tag, :service
    f.actions
  end

  controller do
    def permitted_params
      params.permit link: [:title, :url, :tag_id, :service_id]
    end
  end
end
