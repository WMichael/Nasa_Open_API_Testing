require "json"
require "httparty"

class NeoFeedService
  include HTTParty
  base_uri "api.nasa.gov/neo/rest/v1/feed?start_date=2018-03-24&end_date=2018-03-25"

  attr_accessor :feed

  def initialize
    @api_key = "y5fzEgEZCCWD5XvrHvvb5Agn2rkBI5z9CdtE1aul"
    @feed = JSON.parse(self.class.get("&api_key=#{@api_key}").body)
  end

  def length_of_hash
    @feed.length
  end

  def get_object_type field
    @feed[field].class
  end

end
