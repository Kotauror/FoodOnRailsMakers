class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :text
      t.string :author
      t.integer :score
      t.belongs_to :restaurant
      t.timestamps
    end
  end
end
