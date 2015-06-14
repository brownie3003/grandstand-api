class API::VideosController < ApplicationController
    def index
        videos = Video.all
        render json: videos, status: :ok
    end

    def show
        video = Video.find(params[:id])
        render json: video, status: :ok
    end

    def create
        video = Video.new(video_params)
        if video.save
            render json: video, status: :created, location: api_video_url(video)
        else
            render json: video.errors, status: :unprocessable_entity
        end
    end

    private
        def video_params
            params.require(:video).permit(:url, :description)
        end
end