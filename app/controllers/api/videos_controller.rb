class API::VideosController < ApplicationController
    def index
        videos = Video.all
        render json: videos, status: :ok
    end

    def show
        video = Video.find(params[:id])
        render json: video, status: :ok
    end
end