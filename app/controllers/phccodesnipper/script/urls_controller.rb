require_dependency "phccodesnipper/application_controller"

module Phccodesnipper
  class Script::UrlsController < ApplicationController

    # Include Core Helpers, Security & Action Filters
    include Phccorehelpers::PhcpluginsHelper
    before_action :authenticate_user!
    before_action :set_script_url, only: [:show, :edit, :update, :destroy]

    # INDEX
    def index
      snippet = Script::Snippet.find(params[:snippet_id])
      @script_urls = snippet.urls.all
    end

    # SHOW
    def show
      script_snippet = Script::Snippet.find(params[:snippet_id])
      @script_url = script_snippet.urls.find(params[:id])
    end

    # NEW
    def new
      script_snippet = Script::Snippet.find(params[:snippet_id])
      @script_url = script_snippet.urls.build
    end

    # EDIT
    def edit
    end

    # CREATE
    def create
      @script_snippet = Script::Snippet.find(params[:snippet_id])
      @script_url = @script_snippet.urls.create(script_url_params)
      @script_url.user_id = current_user.id
      if @script_url.save
        redirect_to script_snippet_urls_path, :flash => { :success => 'Script url was successfully created.' }
      else
        render :new
      end
    end

    # UPDATE
    def update
      @script_snippet = Script::Snippet.find(params[:snippet_id])
      if @script_url.update(script_url_params)
        redirect_to script_snippet_urls_path, :flash => { :success => 'Script url was successfully updated.' }
      else
        render :edit
      end
    end

    # DELETE
    def destroy
      @script_snippet = Script::Snippet.find(params[:snippet_id])
      @script_url = @script_snippet.urls.find(params[:id])
      @script_url.destroy
      redirect_to script_snippet_urls_path, :flash => { :error => 'Script url was successfully destroyed.' }
    end

    private

    # Common Callbacks
    def set_script_url
      @script_url = Script::Url.find(params[:id])
    end

    # Whitelist
    def script_url_params
      params.require(:script_url).permit(:script_url, :snippet_id)
    end

  end
end
