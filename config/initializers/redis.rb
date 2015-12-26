uri = URI.parse(ENV["redis://redistogo:285c284f17ddcb2075f37ec3a62d1ad0@tarpon.redistogo.com:11888/"])
REDIS = Redis.new(:url => uri)

