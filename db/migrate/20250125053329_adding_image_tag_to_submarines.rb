class AddingImageTagToSubmarines < ActiveRecord::Migration[7.1]
  def change
    add_column :submarines, :image_tag, :string
  end
end
