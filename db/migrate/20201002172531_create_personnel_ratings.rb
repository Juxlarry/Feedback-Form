class CreatePersonnelRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :personnel_ratings do |t|
      t.integer :nurse_rate
      t.integer :receptionist_rate
      t.integer :pharmacist_rate
      t.integer :doctor_rate
      t.integer :lab_rate
      t.integer :cashier_rate
      t.integer :staff_rate
      t.text :comments

      t.timestamps
    end
  end
end
