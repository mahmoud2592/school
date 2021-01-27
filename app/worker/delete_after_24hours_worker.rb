
#DeleteAfter24hoursWorker.perform_at(post.created_at + POST_DURATION_TIME, post.id)
class DeleteAfter24hoursWorker
    include Sidekiq::Worker
  
    def perform(post_id)
        post = Post.find_by(id: post_id)
        post.delete
    end
  end
  