class TagsController < ApiController
    before_action :authorize_user_request

    def index
        tags = Tag.all
        render( json: { success: true, tags: TagSerializer.new(tags).to_h}, status: :ok )
    end


    def create
        if !params[:tag_name].nil?
            comment = Tag.create(name:params[:tag_name])
            render( json: { success: true}, status: :ok )
        else
            render( json: { success: false}, status: :ok )
        end
    end

end
