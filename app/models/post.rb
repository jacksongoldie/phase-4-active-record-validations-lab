class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { :minimum => 250 }
    validates :summary, length: { :maximum => 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

    validate :no_true_facts_in_title 
    
    def no_true_facts_in_title
        if title == "True Facts"
            errors.add(:title, "Nope!")
        end
    end

end
