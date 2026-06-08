class Dosage < ApplicationRecord
  has_many :medication_dosages
  has_many :medications, through: :medication_dosages
  has_many :medication_records
end
