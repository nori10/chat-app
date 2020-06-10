class UsersController < ApplicationController

    def user_page
      @posts = Post.where(user_id: current_user.id)
    end
  
    def destroy
      post = Post.find(params["id"])
      post.destroy
      redirect_to controller: "users", action: "user_page"
    end
  end