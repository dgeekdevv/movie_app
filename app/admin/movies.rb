# app/admin/products.rb
ActiveAdmin.register Movie do
    permit_params :name, :genres, :director , :main_star, :description, :year

  # Create sections on the index screen
  scope :all, default: true
  # scope :available
  # scope :drafts


  # Customize columns displayed on the index screen in the table
  index do
    column :name
    column :genres
    column :year
    column :director
    column :main_star
    column :description
    column :favorites 

    actions
  end
end
