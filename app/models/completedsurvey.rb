class Completedsurvey < ActiveRecord::Base
 belongs_to :taker, class_name: "User"
 belongs_to :survey
end
