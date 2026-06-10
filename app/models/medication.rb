class Medication < ApplicationRecord
  has_many :medication_dosages, dependent: :destroy
  has_many :dosages, through: :medication_dosages
  has_many :medication_records, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :use, presence: true
  validates :start_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }, allow_blank: true
  validates :dosages, presence: true
end
