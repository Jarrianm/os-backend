class AddCategoryToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :category, :jsonb, default: {}
  end
end
