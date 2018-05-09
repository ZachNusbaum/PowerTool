ActiveAdmin.register Ahoy::Message do
  menu parent: 'Analytics'
  controller do
    actions :all, except: [:edit, :update, :new, :create]
  end

  index do
    id_column
    column :user
    column :mailer
    column :sent_at
    actions
  end

end
