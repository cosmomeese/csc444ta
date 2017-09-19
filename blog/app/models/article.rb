class Article < ApplicationRecord
  #has_many :comments  # first version
  has_many :comments, dependent: :destroy  # second version - supports deletion of comments
  validates :title, presence: true,
                    length: { minimum: 5 }
end
