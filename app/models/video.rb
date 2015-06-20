class Video < ActiveRecord::Base
    validates :source, :url, presence: true
    has_attached_file :source
    validates_attachment_content_type :source, content_type: /video/
end
