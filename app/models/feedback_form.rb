class FeedbackForm < ActiveRecord::Base
  attr_accessible :completed_at, :registration_id

  belongs_to :registration
  has_many :answers, class_name: "FeedbackAnswer"

  after_create do 
    self.completed_at = Time.now
    save!

    true

  end
end
