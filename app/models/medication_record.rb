class MedicationRecord < ApplicationRecord
  belongs_to :medication
  belongs_to :record
  belongs_to :dosage
end
