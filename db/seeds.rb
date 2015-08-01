# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

videos = Video.create(
        [
            {
                description: "This is my youtube video",
                source: File.new("#{Rails.root}/test/fixtures/files/videos/test.mp4")
            }, {
                description: "This is my vimeo video",
                source: File.new("#{Rails.root}/test/fixtures/files/videos/test.mp4")
            }
        ])

Video.all.each do |video|
    video.update!(url: Rails.application.routes.url_helpers.play_api_video_url(video[:id]))
end
