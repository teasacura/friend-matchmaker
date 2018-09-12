class Match < ApplicationRecord

  belongs_to :matcher, foreign_key: "matcher_id", class_name: "User"
  belongs_to :matchee, foreign_key: "matchee_id", class_name: "User"

  validate :unique_match

  # validates that the match is unique
  def unique_match
    Match.all.each do |match|
      if (match.matcher_id == self.matcher_id) && (match.matchee_id == self.matchee_id) || (match.matcher_id == self.matchee_id) && (match.matchee_id == self.matcher_id)
        errors.add(:unique_match, "already exists")
      end
    end
  end

  def compatibility
    total = 0
    if matcher.quiz.q1 == matchee.quiz.q1
      total += 1
    elsif matcher.quiz.q2 == matchee.quiz.q2
      total += 1
    elsif matcher.quiz.q3 == matchee.quiz.q3
      total += 1
    elsif matcher.quiz.q4 == matchee.quiz.q4
      total += 1
    elsif matcher.quiz.q5 == matchee.quiz.q5
      total += 1
    else
      total += 0
    end
      total
  end

end
