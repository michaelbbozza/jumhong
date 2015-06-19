class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.text :description
      t.references :creator

      t.timestamps null: false
    end
  end
end
