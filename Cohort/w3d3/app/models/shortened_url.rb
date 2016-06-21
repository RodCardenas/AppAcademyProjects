require 'SecureRandom'

class ShortenedUrl < ActiveRecord::Base
  validates :short_URL, uniqueness: true

  belongs_to :submitter,
    foreign_key: :submitter_id,
    primary_key: :id,
    class_name: :User

  has_many :visitors,
    Proc.new { distinct },
    through: :times_visited,
    source: :who

  has_many :times_visited,
    foreign_key: :url_id,
    primary_key: :id,
    class_name: :Visit

  has_many :taggings,
    foreign_key: :url_id,
    primary_key: :id,
    class_name: :Tagging

  has_many :tagtopics,
    through: :taggings,
    source: :tagtopics

  def self.random_code
    begin
      str = ''
      str+= SecureRandom.urlsafe_base64(16)
      str = str[0..15]
    end until !ShortenedUrl.all.exists?(:short_URL => str)
    str
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(:long_URL=>long_url, :short_URL => ShortenedUrl.random_code, :submitter_id => user[:id])
  end

  def num_clicks
    # self.times_visited.count
    Visit.count('url_id = id')
  end

  def num_uniques
    self.visitors.count
    # ShortenedUrl.count('DISTINCT submitter_id')
  end

  def num_recent_uniques
    Visit.where(:created_at => 10.minutes.ago..0.minutes.ago).count
  end
end
