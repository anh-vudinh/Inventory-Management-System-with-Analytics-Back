class CompanyRole < ApplicationRecord
  belongs_to :company
  belongs_to :role
end
