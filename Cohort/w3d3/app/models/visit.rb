class Visit < ActiveRecord::Base
validates :user_id, :url_id, presence: true

  belongs_to :who,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

  belongs_to :where,
    foreign_key: :url_id,
    primary_key: :id,
    class_name: :ShortenedUrl

  def self.record_visit!(user, shortened_url)
    Visit.create(:user_id => user[:id], :url_id => shortened_url[:id])
  end
end
