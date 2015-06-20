class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :creator

      t.timestamps null: false
    end
  end
end
