class Question < ApplicationRecord
  belongs_to :test
  
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :count_answer


  private

  def count_answer
    return if  answers.count.between?(1,4)
        
    errors.add(:answers, 'Must have 1 to 4 answers')
  end
end
