class Chapter < ActiveRecord::Base

    belongs_to :khatma
    has_and_belongs_to_many :users

end
