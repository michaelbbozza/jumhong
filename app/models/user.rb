class User < ActiveRecord::Base
 has_many :surveys, foreign_key: :creator_id
 has_many :completedsurveys, foreign_key: :taker_id
 has_many :selections, foreign_key: :taker_id
 has_many :choices, through: :selections, foreign_key: :taker_id
end
