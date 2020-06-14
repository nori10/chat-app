class PostsController < ApplicationController
  before_action :authenticate_user!

    def home
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
        @comment = Comment.new
        @comments = @post.comments.order(created_at: :desc)
      end

    def new
        
    end

    def create
        Post.create(body:params["posts"]["body"], user_id:current_user.id)
        redirect_to "/"
    end
end
