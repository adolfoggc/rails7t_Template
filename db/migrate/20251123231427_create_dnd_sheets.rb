class CreateDndSheets < ActiveRecord::Migration[7.1]
  def change
    create_table :dnd_sheets do |t|
      t.string :name
      t.integer :folk
      t.integer :gender

      t.timestamps
    end
  end
end
