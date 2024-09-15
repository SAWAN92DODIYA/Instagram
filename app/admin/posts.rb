ActiveAdmin.register Post do
  permit_params :title, :body, :published_at, :user_id

  filter :title_cont, label: 'Title' # Add a filter for the name attribute
  filter :body_cont, label: 'Body' # Add a filter for the email attribute
  filter :published_at, label: 'Published_at'
  # filter :user_id, with: 'user_id'

  index do
    selectable_column
    id_column
    column :title
    column :body

    actions
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :title
      f.input :body
    end
    f.actions
  end

end