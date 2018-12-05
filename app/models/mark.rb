class Mark < ApplicationRecord
	
  belongs_to :post

  validates :value, inclusion: { in: (1..5), message: 'Mark is beyond scope' }

end
