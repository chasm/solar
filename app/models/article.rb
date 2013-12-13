class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, :content, presence: true
  validates :title, uniqueness: true

  searchable do
    text :title, :content
    time :published_on
    string :sort_title do
      title.downcase.sub(/^(an?|the) /, '')
    end
  end
end
