class AddDetailsToSubmarines < ActiveRecord::Migration[7.1]
  def change
    add_column :submarines, :description, :text
    add_column :submarines, :weight_ton, :integer
    add_column :submarines, :submarine_class, :string
    add_column :submarines, :prod_year, :integer
    add_column :submarines, :amenities, :string
    add_column :submarines, :speed, :integer
    add_column :submarines, :price, :integer
  end
end
