class AddUserRefToGrams < ActiveRecord::Migration[6.0]
  def change
    add_reference :grams, :user, null: false, foreign_key: true
  end
end
