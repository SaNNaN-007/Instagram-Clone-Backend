class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  def index
    @posts = Post.all

    render json: @posts
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.user_id != params[:user_id].to_i
      
      render json: { error: 'You are not authorized to update this post' }, status: :unauthorized
    else
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @post.user_id != params[:user_id].to_i

      render json: { error: 'You are not authorized to delete this post' }, status: :unauthorized
    else
      @post.destroy
      render json: { message: 'Post deleted' }, status: :ok
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.permit(:user_id, :description, :image)
    end
end
