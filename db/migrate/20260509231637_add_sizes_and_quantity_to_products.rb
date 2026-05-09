class AddSizesAndQuantityToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :sizes, :jsonb, default: []
  end
end
