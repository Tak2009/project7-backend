class CreateEuropeAmericas < ActiveRecord::Migration[6.0]
  def change
    ccreate_table :europe_americas do |t|
      t.string :category
      t.integer :id_number
      t.string :region
      t.string :site
      t.string :states
      t.string :image_url
      t.string :image_pic
      t.string :location
      t.string :short_description
      t.string :http_url
      t.integer :index
      

      t.timestamps
    end
  end
end
