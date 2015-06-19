class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :users, through: :selections, foreign_key: :taker_id
end
