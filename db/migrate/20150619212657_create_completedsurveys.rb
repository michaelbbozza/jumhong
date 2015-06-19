class CreateCompletedsurveys < ActiveRecord::Migration
  def change
    create_table :completedsurveys do |t|
      t.references :taker
      t.references :survey

      t.timestamps null: false
    end
  end
end
