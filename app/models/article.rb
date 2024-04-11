class Article < ApplicationRecord
  include Visible

  # If you delete an article, its associated comments will also need to be deleted
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def archived?
    status == 'archived'
  end
end
