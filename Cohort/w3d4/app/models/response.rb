# require_dependency 'app/validators/response_validator.rb'

class Response < ActiveRecord::Base
  validates :answer_choice_id, presence: true
  validates :user_id, :presence => true
  validate :respondent_is_not_author
  # validate :respondent_has_not_answered

  belongs_to :respondent,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

  belongs_to :answer_choice,
    foreign_key: :answer_choice_id,
    primary_key: :id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll

  has_one :poll_author,
    through: :poll,
    source: :author

  def sibling_responses
    self.question.responses.where.not(id: self[:id])
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self[:user_id])
  end

  def respondent_has_not_answered
    if self.respondent_already_answered?
      message = "User has already answered this question."
      errors[:user_id] << message
    end
  end

  def respondent_is_not_author
    if self.question.poll.author.id == self.respondent.id
      message = " #{self.respondent.user_name} wrote this question."
      errors[:author_id] << message
    end
  end

end
