class CreateFavoriteLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_leagues do |t|
      t.references :league, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
