class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :slug
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
