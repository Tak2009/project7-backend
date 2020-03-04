class CreateApacs < ActiveRecord::Migration[6.0]
  def change
    create_table :apacs do |t|
      t.string :category

      t.timestamps
    end
  end
end
