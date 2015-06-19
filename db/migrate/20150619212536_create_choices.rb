class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :question
      t.string :content

      t.timestamps null: false
    end
  end
end
