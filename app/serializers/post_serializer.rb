class PostSerializer < ApplicationSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :title, :body

    attribute :tags do |object, params|
      tags_ids = PostTag.where(post_id: object.id).select(:tag_id)
      tags = Tag.where(id: tags_ids)
      TagSerializer.new(tags, { params: params }).to_h
    end
  
end