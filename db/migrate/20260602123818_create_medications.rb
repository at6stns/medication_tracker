class CreateMedications < ActiveRecord::Migration[8.1]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :use
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
