class CreateCompletedsurveys < ActiveRecord::Migration
  def change
    create_table :completedsurveys do |t|
      t.string :user_id
      t.string :survey_id

      t.timestamps null: false
    end
  end
end
