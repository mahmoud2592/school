class PostsController < ApiController
    before_action :authorize_user_request

    def index
        posts = Post.all
        render( json: { success: true, posts: PostSerializer.new(posts).to_h }, status: :ok )
    end

    def create
        if post_params[:title].present? && post_params[:body].present?
            tags_ids_list = []
            has_tag_id = false
            if !post_tags_params[:tags_ids].nil?
                post_tags_params[:tags_ids].each do |tag_id|
                    my_tag = Tag.find_by(id: tag_id)
                    if !my_tag.nil?
                        has_tag_id = true
                        tags_ids_list << tag_id
                    end
                end
            end

            if has_tag_id
                post = Post.create(title:post_params[:title], body: post_params[:body], user_id: @current_user.id)
                tags_ids_list.each do |tag_id|
                    PostTag.create(tag_id: tag_id, post_id: post.id)
                end
                # worker
                # DeleteAfter24hoursWorker.perform_at(post.created_at + POST_DURATION_TIME, post.id)
                render( json: { success: true, posts: PostSerializer.new(post).to_h }, status: :ok )
            else
                render json: {error: "Post must has at least one tag!"}
            end
        else 
            render json: {error: "Post has missing data!"}
        end
    end

    def show
        post = Post.find(params[:id])
        render( json: { success: true, posts: PostSerializer.new(post).to_h }, status: :ok )
    end

    def update
        tags_ids_list = []
        has_tag_id = false
        post_tags_params[:tags_ids].each do |tag_id|
            my_tag = Tag.find_by(id: tag_id)
            if !my_tag.nil?
                has_tag_id = true
                tags_ids_list << tag_id
            end
        end

        if has_tag_id
            post = Post.find_by(id: params[:id])
            post.update(post_params)
            PostTag.where(post_id: post.id).destroy_all
            tags_ids_list.each do |tag_id|
                PostTag.create(tag_id: tag_id, post_id: post.id)
            end
            render( json: { success: true, posts: PostSerializer.new(post).to_h }, status: :ok )
        else
            render json: {error: "Post must has at least one tag!"}
        end
    end

    def destroy
        post = Post.find_by(id: params[:id])
        if post&.user_id == @current_user.id
            post.destroy
            render( json: { success: true, status: :ok } )
        else
            render json: {error: "This post is not related to the current user!"}
        end
    end

    private

    def post_params
        params.permit(:title, :body)
    end

    def post_tags_params
        params.permit(:tags_ids => [])
    end
end
