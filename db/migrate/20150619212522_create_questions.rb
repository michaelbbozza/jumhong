class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :survey
      t.string :content null: false

      t.timestamps null: false
    end
  end
end
