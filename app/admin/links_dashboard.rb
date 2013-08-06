ActiveAdmin.register Link do
  index do
    column :title
    column :url
    column :user
    default_actions
  end

  form do |f|
    f.inputs :title, :url, :tag, :service, :user
    f.actions
  end

  controller do
    def permitted_params
      params.permit :utf8, :authenticity_token, :commit, link: [
        :title, :url, :tag_id, :service_id, :user_id
      ]
    end
  end
end
