# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

videos = Video.create(
        [
            { url: "http://www.youtube.com/myvideo",
              description: "This is my youtube video"
            }, {
              url: "http://www.vimeo.com/yourvideo",
              description: "This is your vimeo video"
            }
        ])
