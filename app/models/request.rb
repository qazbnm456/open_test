class Request < ActiveRecord::Base
  validates :title, :client, :description, presence: true

  has_many :urbs
  has_many :users, :through => :urbs
  has_many :permits, :through => :urbs
  has_many :bugs

  def find_similarity(queue_bug)
    if !queue_bug.url.empty?
      bugs.each do |db_bug|
        if !db_bug.url.empty?
          if queue_bug.url.similar(db_bug.url) > 90
            if !queue_bug.parameter_1.empty? || !queue_bug.parameter_2.empty? || !queue_bug.parameter_3.empty?
              if queue_bug.parameter_1.similar(db_bug.parameter_1) > 90 || queue_bug.parameter_2.similar(db_bug.parameter_2) > 90 \
              || queue_bug.parameter_3.similar(db_bug.parameter_3) > 90
                return true
              end
            end
          end
        end
      end
    end
    false
  end
end