class API::VideosController < ApplicationController
    def index
        videos = Video.all
        render json: videos, status: :ok
    end
end