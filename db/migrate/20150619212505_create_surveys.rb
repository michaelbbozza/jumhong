class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.string :description
      t.string :creator_id

      t.timestamps null: false
    end
  end
end
