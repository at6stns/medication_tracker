class CreateDosages < ActiveRecord::Migration[8.1]
  def change
    create_table :dosages do |t|
      t.string :name

      t.timestamps
    end
  end
end
