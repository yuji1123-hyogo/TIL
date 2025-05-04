class Task < ApplicationRecord
  validates :name,presence: true,length:{maximum:30}
  validate :validate_name_not_include_commma

  belongs_to: user
  
  private

  def validate_name_not_include_commma
    errors.add(:name,"に,は含めることができません") if name&.include?('.')
  end
end
