require 'test_helper'

class VideosAPITest < ActionDispatch::IntegrationTest
    setup do
        host! 'api.grandstand.com'
    end

    test 'returns a list of videos' do
        get '/videos'

        assert_equal 200, response.status

        server_response = json(response.body)

        assert_equal 2, server_response[:videos].length
    end

    test 'return a specific video' do
        video = Video.first

        get "/videos/#{video.id}"

        assert_equal 200, response.status

        server_response = json(response.body)

        assert_equal video.url, server_response[:video][:url]
    end

    test 'create new video' do

        video_source = {
            video: {
                source: fixture_file_upload('/files/videos/test.mp4', 'video/mp4'),
                description: "hello"
            }
        }

        post '/videos', video_source

        assert_equal 201, response.status
        assert_equal Mime::JSON, response.content_type

        video = json(response.body)[:video]
        assert_equal api_video_url(video[:id]), response.location
    end

    test 'does not create video with empty url' do
        post '/videos',
             {
                video:
                    {
                        url: nil,
                        description: "This is a description"
                    }
             }.to_json,
             { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

        assert_equal 422, response.status
        assert_equal Mime::JSON, response.content_type
    end
end