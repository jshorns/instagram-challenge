class RemoveTitleFromAddDescriptionToGrams < ActiveRecord::Migration[6.0]
  def change
    add_column :grams, :description, :string
    remove_column :grams, :title
  end
end
