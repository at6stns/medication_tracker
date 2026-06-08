class Record < ApplicationRecord
  belongs_to :user
  has_many :medication_records, dependent: :destroy
  has_many :medications, through: :medication_records
end
