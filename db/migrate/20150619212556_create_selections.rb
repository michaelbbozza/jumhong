class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.string :taker_id
      t.string :choice_id

      t.timestamps null: false
    end
  end
end
