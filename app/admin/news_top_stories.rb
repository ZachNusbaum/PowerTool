ActiveAdmin.register News::TopStory do
  menu parent: 'News'
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  controller do
    defaults finder: :find_by_token!
    actions :all, except: [:destroy, :new, :create, :edit, :update]
  end

  index do
    id_column
    column(:source) { |s| s.source ? s.source.name : 'n/a'}
    column :title
    column :published_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :source
      row :description
      row :published_at
    end
  end

end
