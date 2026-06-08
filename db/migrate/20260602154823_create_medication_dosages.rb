class CreateMedicationDosages < ActiveRecord::Migration[8.1]
  def change
    create_table :medication_dosages do |t|
      t.references :medication, null: false, foreign_key: true
      t.references :dosage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
