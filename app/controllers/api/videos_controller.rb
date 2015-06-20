class API::VideosController < ApplicationController
    def index
        videos = Video.all
        render json: videos, status: :ok
    end

    def show
        @video = Video.find(params[:id])
        # render :show
        render json: video, status: :ok
    end

    def create
        video = Video.new(video_params)
        video.url = video.source.url
        if video.save
            render json: video, status: :created, location: api_video_url(video)
        else
            render json: video.errors, status: :unprocessable_entity
        end
    end

    # def new
    #     @video = Video.new
    # end

    private
        def video_params
            params.require(:video).permit(:description, :source)
        end
end