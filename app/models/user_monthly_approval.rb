class UserMonthlyApproval < ApplicationRecord
	belongs_to :staff
	
	has_many :expense_entries, dependent: :destroy
	has_many :file_uploads, dependent: :destroy
	accepts_nested_attributes_for :expense_entries, reject_if: :all_blank, allow_destroy: true
	#validates_uniqueness_of :date
	
	#def grand_total
	#	expense_entries.map{|x| x.total_expenses}.sum
	#end
end
