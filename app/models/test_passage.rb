class TestPassage < ApplicationRecord
  PASS_PERCENTAGE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question, on: [:create, :update]

  def completed?
    time_over? || current_question.nil?
  end

  def test_passed?
    success_count >= PASS_PERCENTAGE
  end
  
  def accept!(answer_ids)
    if time_over?
      self.current_question = nil
      return
    end

    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.passed = true if test_passed?

    save!
  end

  def success_count
    (correct_questions.to_f / test.questions.count) * 100
  end

  def test_passed_ids
    user.test_passages.where(passed: true).pluck(:test_id).uniq
  end

  def remaining_time
    (test.timer - (Time.current - created_at).seconds).to_i
  end

  def time_over?
    remaining_time <= 0
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end 
  end
end
