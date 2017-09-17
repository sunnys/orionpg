class Match < ApplicationRecord
    belongs_to :user
    belongs_to :reportee, class_name: "User"
end
