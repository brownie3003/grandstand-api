class Video < ActiveRecord::Base
    validates :source, presence: true
    has_attached_file :source
    validates_attachment_content_type :source, content_type: /video/
end
