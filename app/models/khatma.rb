class Khatma < ActiveRecord::Base

    belongs_to :user
    has_many :chapters, :dependent => :destroy

end
