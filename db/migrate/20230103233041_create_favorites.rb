class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
      validates_uniqueness_of :user_id, scope: :user_id
    end
  end
end
