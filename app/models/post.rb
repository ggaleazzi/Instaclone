class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :pic
end

# this connects the post to the user belonging to one user only