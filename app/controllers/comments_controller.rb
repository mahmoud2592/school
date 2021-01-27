class CommentsController < ApiController
    before_action :authorize_user_request

    def create
        if comment_params[:post_id].present? && comment_params[:text].present? && comment_params[:image].present?
            comment = Comment.create(post_id:comment_params[:post_id], text:comment_params[:text], image:comment_params[:image], user_id: @current_user.id)
            render( json: { success: true, posts: CommentSerializer.new(comment).to_h }, status: :ok )
        else
            render json: {error: "Error: missing data"}
        end
    end

    def update
        if params[:id].present?
            comment = Comment.find_by(id: params[:id])
            if comment&.user_id == @current_user.id
                comment.update(comment_params)
                render( json: { success: true, posts: CommentSerializer.new(comment).to_h }, status: :ok )
            else
                render json: {error: "This comment is not related to the current user!"}
            end
        else
            render json: {error: "Error: missing comment Id"}
        end
    end

    def destroy
        if params[:id].present?
            comment = Comment.find_by(id: params[:id])
            if comment&.user_id == @current_user.id
                comment.destroy
                render( json: { success: true, status: :ok })
            else
                render json: {error: "This comment is not related to the current user!"}
            end
        else
            render json: {error: "Error: missing comment Id"}
        end
    end
    
    private
    def comment_params
        params.permit(:text, :image, :post_id)
    end
end
