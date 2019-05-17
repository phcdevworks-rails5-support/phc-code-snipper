require_dependency "phccodesnipper/application_controller"

module Phccodesnipper
  class Script::SnippetsController < ApplicationController

    # Include Core Helpers, Security & Action Filters
    include Phccorehelpers::PhcpluginsHelper
    before_action :authenticate_user!
    before_action :set_script_snippet, only: [:show, :edit, :update, :destroy]

    # INDEX
    def index
      @script_snippets = Script::Snippet.all
    end

    # SHOW
    def show
    end

    # NEW
    def new
      @script_snippet = Script::Snippet.new
    end

    # EDIT
    def edit
    end

    # CREATE
    def create
      @script_snippet = Script::Snippet.new(script_snippet_params)
      if @script_snippet.save
        redirect_to @script_snippet, :flash => { :success => 'Snippet was successfully created.' }
      else
        render :new
      end
    end

    # UPDATE
    def update
      if @script_snippet.update(script_snippet_params)
        redirect_to @script_snippet, :flash => { :success => 'Snippet was successfully updated.' }
      else
        render :edit
      end
    end

    # DELETE
    def destroy
      @script_snippet.destroy
      redirect_to script_snippets_url, :flash => { :error => 'Snippet was successfully destroyed.' }
    end

    private

    # Common Callbacks
    def set_script_snippet
      @script_snippet = Script::Snippet.find(params[:id])
    end

    # Whitelist
    def script_snippet_params
      params.require(:script_snippet).permit(:snippet_title, :snippet_code)
    end

  end
end
