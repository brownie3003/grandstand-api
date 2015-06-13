class VideoSerializer < ActiveModel::Serializer
    attributes :id,
               :url,
               :description
end
