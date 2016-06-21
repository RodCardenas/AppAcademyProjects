class Tagtopic < ActiveRecord::Base
  has_many :taggings,
    foreign_key: :tagtopic_id,
    primary_key: :id,
    class_name: :Tagging

  has_many :urls,
    through: :taggings,
    source: :urls

end
