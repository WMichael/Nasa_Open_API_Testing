require_relative "services/neo_feed_serice"

class Nasa_API

  def Neo_Feed_service
    NeoFeedService.new
  end

end
