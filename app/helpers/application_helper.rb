module ApplicationHelper
	def post_id(post)
    post.id if post && post.id.present?
  end
end
