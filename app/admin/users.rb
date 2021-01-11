ActiveAdmin.register User do
  config.clear_action_items!
  actions :index, :destroy

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :username
  #
  # or
  #
  # permit_params do
  #   permitted = [:username]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :id
    column :username
    column :created_at
    column :favorite_movies do |user|
      user.movies.count
    end  
  end  
end
