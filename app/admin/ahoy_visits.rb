ActiveAdmin.register Ahoy::Visit do
  menu parent: 'Analytics'
  controller do
    actions :all, except: [:new, :create, :edit, :update]
  end
  index do
    id_column
    column :user
    column :started_at
    column :ip
    actions
  end
end
