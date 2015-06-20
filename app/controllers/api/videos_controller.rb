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
            # TODO figure out if URL generation happens before upload is complete
            # or afterwards. If before we won't get stuck here.
            video.update!(url: absolute_url_to_video)
            render json: video, status: :created, location: api_video_url(video)
        else
            render json: video.errors, status: :unprocessable_entity
        end
    end

    def play
        send_file('/Users/Mongoose/Downloads/RailsCasts/' + @video.path)
    end

    private
        def set_video
            @video = Video.find(params[:id])
        end

        def video_params
            params.require(:video).permit(:description, :source)
        end
end