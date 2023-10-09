module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "#{t('.edit')} #{question.test.title} #{t('.question')}"
    else
      "#{t('.create')} #{question.test.title} #{t('.question')}"
    end
  end
end
