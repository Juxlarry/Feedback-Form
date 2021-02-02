class RatingScore < ApplicationRecord
    has_one_attached :score_emojis
end
