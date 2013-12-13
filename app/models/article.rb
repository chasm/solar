class Article < ActiveRecord::Base
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
