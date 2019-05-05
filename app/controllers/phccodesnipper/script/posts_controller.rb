require_dependency "phccodesnipper/application_controller"

module Phccodesnipper
  class Script::PostsController < ApplicationController
    before_action :set_script_post, only: [:show, :edit, :update, :destroy]

    # GET /script/posts
    def index
      @script_posts = Script::Post.all
    end

    # GET /script/posts/1
    def show
    end

    # GET /script/posts/new
    def new
      @script_post = Script::Post.new
    end

    # GET /script/posts/1/edit
    def edit
    end

    # POST /script/posts
    def create
      @script_post = Script::Post.new(script_post_params)

      if @script_post.save
        redirect_to @script_post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /script/posts/1
    def update
      if @script_post.update(script_post_params)
        redirect_to @script_post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /script/posts/1
    def destroy
      @script_post.destroy
      redirect_to script_posts_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_script_post
        @script_post = Script::Post.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def script_post_params
        params.require(:script_post).permit(:script_tittle, :script_snippet)
      end
  end
end
