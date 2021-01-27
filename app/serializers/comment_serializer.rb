class CommentSerializer < ApplicationSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :text, :image
    
end