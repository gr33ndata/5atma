class Khatma < ActiveRecord::Base

    belongs_to :user
    has_many :chapters, :dependent => :destroy

    validates :description, presence: true

end
