class Quiz < ApplicationRecord
  belongs_to :user
  def total
    (self.q1 + self.q2 + self.q3 + self.q4 + self.q5) * 10
  end
end
