class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :count_answer, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def count_answer
    errors.add(:body, 'Must have 1 to 4 answers') if question.answers.count >= 4
  end
end
