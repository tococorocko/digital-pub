class CreatePrognoses < ActiveRecord::Migration[5.2]
  def change
    create_table :prognoses do |t|
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :team_a_score
      t.integer :team_b_score

      t.timestamps
    end
  end
end
