class CreateRatingScores < ActiveRecord::Migration[5.1]
  def change
    create_table :rating_scores do |t|
      t.text :score_name

      t.timestamps
    end
  end
end
