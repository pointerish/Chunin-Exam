ActiveAdmin.register Link do
  permit_params :url
  config.comments = false

  filter :url
  filter :click_count

  index do
    selectable_column
    column :url
    column :click_count
    column :created_at
    actions
  end

  form do |f|
    f.inputs :url
    actions
  end

end
