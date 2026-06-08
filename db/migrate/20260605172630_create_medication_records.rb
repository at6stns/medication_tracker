class CreateMedicationRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :medication_records do |t|
      t.boolean :taken
      t.references :medication, null: false, foreign_key: true
      t.references :record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
