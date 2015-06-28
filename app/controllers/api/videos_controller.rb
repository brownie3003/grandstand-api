class API::VideosController < ApplicationController
    before_action :set_video, only: [:show, :play]
    def index
        videos = Video.all
        render json: videos, status: :ok
    end

    def show
        render json: @video, status: :ok
    end

    def create
        video = Video.new(video_params)
        if video.save
            # Would be nicer to do this before the save, but don't have the ID
            video.update!(url: play_api_video_url(video[:id]))
            render json: video, status: :created, location: api_video_url(video)
        else
            render json: video.errors, status: :unprocessable_entity
        end
    end

    def play
        # redirect_to rather than send_file
        redirect_to(@video.source.url)
    end

    private
        def set_video
            @video = Video.find(params[:id])
        end

        def video_params
            params.require(:video).permit(:description, :source)
        end
end