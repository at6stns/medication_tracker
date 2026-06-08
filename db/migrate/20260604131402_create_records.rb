class CreateRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :records do |t|
      t.date :date
      t.text :memo

      t.timestamps
    end
  end
end
