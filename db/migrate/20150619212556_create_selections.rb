class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.references :taker
      t.references :choice

      t.timestamps null: false
    end
  end
end
