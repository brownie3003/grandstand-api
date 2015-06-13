require 'test_helper'

class VideosAPITest < ActionDispatch::IntegrationTest
    setup do
        host! 'api.grandstand.com'
    end

    test 'returns a list of videos' do
        get '/videos'

        assert_equal 200, response.status

        server_response = JSON.parse(response.body)

        assert_equal 2, server_response["videos"].length
    end

    test 'return a specific video' do
        video = Video.first

        get "/videos/#{video.id}"

        assert_equal 200, response.status

        server_response = JSON.parse(response.body, symbolize_names: true)

        assert_equal video.url, server_response[:video][:url]
    end
end