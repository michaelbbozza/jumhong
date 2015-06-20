class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :question, null: false
      t.string :content, null: false

      t.timestamps null: false
    end
  end
end
