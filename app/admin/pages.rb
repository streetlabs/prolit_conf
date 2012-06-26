ActiveAdmin.register Page do
  index do
    column :id
    column :identifier
    column :title
    default_actions
  end
end
