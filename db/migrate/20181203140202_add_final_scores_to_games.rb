class AddFinalScoresToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :team_a_final_score, :integer, default: nil
    add_column :games, :team_b_final_score, :integer, default: nil
  end
end
