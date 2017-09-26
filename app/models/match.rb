class Match < ApplicationRecord
    belongs_to :employee
    belongs_to :reportee, class_name: "Employee"
end
