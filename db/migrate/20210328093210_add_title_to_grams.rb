class AddTitleToGrams < ActiveRecord::Migration[6.0]
  def change
    add_column :grams, :title, :string
  end
end
