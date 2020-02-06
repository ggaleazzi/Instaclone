class PostsController < ApplicationController
    def index
      @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      if @post.save
        redirect_to @post
        flash[:notice] = "Post created"
      else 
        redirect_back(fallback_location: roots_path)
        flash[:alert] = "Post Creation Failed"
      end
     end 
     def edit 
      @post = Post.find(params[:id])
     end 

    def update
      @post = Post.find(params[:id])
      @post.update(post_params)
        
        redirect_to @post
    end
    def show
      @post = Post.find(params[:id])
    end
  

  private 
  def post_params
    params.require(:post).permit(:caption, :pic)
  end
end