class Comment < ApplicationRecord
   belongs_to :user
   belongs_to :hotel

   validates :comment, presence: true

end
