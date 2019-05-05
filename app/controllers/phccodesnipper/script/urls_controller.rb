require_dependency "phccodesnipper/application_controller"

module Phccodesnipper
  class Script::UrlsController < ApplicationController
    before_action :set_script_url, only: [:show, :edit, :update, :destroy]

    # GET /script/urls
    def index
      @script_urls = Script::Url.all
    end

    # GET /script/urls/1
    def show
    end

    # GET /script/urls/new
    def new
      @script_url = Script::Url.new
    end

    # GET /script/urls/1/edit
    def edit
    end

    # POST /script/urls
    def create
      @script_url = Script::Url.new(script_url_params)

      if @script_url.save
        redirect_to @script_url, notice: 'Url was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /script/urls/1
    def update
      if @script_url.update(script_url_params)
        redirect_to @script_url, notice: 'Url was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /script/urls/1
    def destroy
      @script_url.destroy
      redirect_to script_urls_url, notice: 'Url was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_script_url
        @script_url = Script::Url.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def script_url_params
        params.require(:script_url).permit(:script_url)
      end
  end
end
