class Survey < ActiveRecord::Base
  has_many :completedsurveys
  has_many :users, through: :completedsurveys, foreign_key: :taker_id
  has_many :questions
  belongs_to :creator, class_name: "User"
end
