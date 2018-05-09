ActiveAdmin.register Ahoy::Event do
  menu parent: 'Analytics'
  controller do
    actions :all, except: [:new, :create, :edit, :update]
  end

  index do
    id_column
    column :visit
    column :user
    column :name
    column :time
    actions
  end

  show do
    attributes_table do
      row :visit
      row :user
      row :name
      row :time
    end
    panel 'Properties' do
      attributes_table_for resource.properties do
        resource.properties.each do |key, val|
          row(key.to_sym) { val }
        end
      end
    end
  end
end
