ActiveAdmin.register Request do

  config.comments = false

  filter :link_id
  filter :device
  filter :ip
  filter :created_at

  index do
    selectable_column
    column :link
    column :device
    column :ip
    column :created_at
    actions
  end
end
