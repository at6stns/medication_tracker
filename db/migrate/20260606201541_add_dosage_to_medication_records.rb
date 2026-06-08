class AddDosageToMedicationRecords < ActiveRecord::Migration[8.1]
  def change
    add_reference :medication_records, :dosage, foreign_key: true
  end
end
