class Medication < ApplicationRecord
  has_many :medication_dosages, dependent: :destroy
  has_many :dosages, through: :medication_dosages
  has_many :medication_records, dependent: :destroy
  belongs_to :user
end
