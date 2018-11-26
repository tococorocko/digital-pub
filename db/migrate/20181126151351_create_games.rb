class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :team_a, foreign_key: { to_table: :teams }
      t.references :team_b, foreign_key: { to_table: :teams }
      t.references :league, foreign_key: true
      t.datetime :kick_off_time

      t.timestamps
    end
  end
end
