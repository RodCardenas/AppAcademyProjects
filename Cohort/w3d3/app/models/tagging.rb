class Tagging < ActiveRecord::Base
  belongs_to :tagtopics,
    foreign_key: :tagtopic_id,
    primary_key: :id,
    class_name: :Tagtopic

  belongs_to :urls,
    foreign_key: :url_id,
    primary_key: :id,
    class_name: :ShortenedUrl
end
