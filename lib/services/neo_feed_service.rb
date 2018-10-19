require "json"
require "httparty"

class NeoFeedService
  include HTTParty
  base_uri "https://api.nasa.gov/neo/rest/v1/feed?start_date=2018-03-24&end_date=2018-03-25"

  attr_accessor :feed

  def initialize
    @api_key = "y5fzEgEZCCWD5XvrHvvb5Agn2rkBI5z9CdtE1aul"
    @feed = JSON.parse(self.class.get("&api_key=#{@api_key}").body)
  end

  def length_of_hash
    @feed.length
  end

  def length_of_inner_hash hash_name
    @feed[hash_name].length
  end

  def get_object_type field
    @feed[field].class
  end

  def get_object_type_in_links field
    @feed["links"][field].class
  end

  # Currently putting in each field in the hash to check the length as I'm having trouble using .each.
  def is_number_of_nearearthobjects_correct?
    total = 0
    total += @feed["near_earth_objects"]["2018-03-25"].length
    total += @feed["near_earth_objects"]["2018-03-24"].length
    unless total == @feed["element_count"]
      return false
    end
    return true
  end

  def get_object_type_in_nearearthobjects field
    @feed["near_earth_objects"][field].class
  end

  def is_object_type_in_element_of_day fieldname,object_type
    is_type = true

    @feed["near_earth_objects"]["2018-03-25"].each do |element|
      unless element[fieldname].is_a? object_type
        is_type = false
      end
    end
    @feed["near_earth_objects"]["2018-03-24"].each do |element|
      unless element[fieldname].is_a? object_type
        is_type = false
      end
    end
    return is_type
  end

  def is_estimated_diameters_float distance,field
    is_float = true

    @feed["near_earth_objects"]["2018-03-25"].each do |element|
      unless element["estimated_diameter"][distance][field].is_a? Float
        is_float = false
      end
    end
    @feed["near_earth_objects"]["2018-03-24"].each do |element|
      unless element["estimated_diameter"][distance][field].is_a? Float
        is_float = false
      end
    end
    return is_float
  end

  def is_object_type_in_close_approach_data field,object_type
    is_type = true
    @feed["near_earth_objects"]["2018-03-25"].each do |element|
      element["close_approach_data"].each do |innerelement|
        unless innerelement[field].is_a? object_type
          is_type = false
        end
      end
    end
    @feed["near_earth_objects"]["2018-03-24"].each do |element|
      element["close_approach_data"].each do |innerelement|
        unless innerelement[field].is_a? object_type
          is_type = false
        end
      end
    end
    return is_type
  end

  def is_length_of_estimated_diameter_4
    is_four = true
    @feed["near_earth_objects"]["2018-03-25"].each do |element|
      unless element["estimated_diameter"].length == 4
        is_four = false
      end
    end
    @feed["near_earth_objects"]["2018-03-25"].each do |element|
      unless element["estimated_diameter"].length == 4
        is_four = false
      end
    end
    return is_four
  end

  def is_length_of_hash_in_estimated_diameter_2 field
    is_two = true
    @feed["near_earth_objects"]["2018-03-25"].each do |element|
      unless element["estimated_diameter"][field].length == 2
        is_two = false
      end
    end
    @feed["near_earth_objects"]["2018-03-24"].each do |element|
      unless element["estimated_diameter"][field].length == 2
        is_two = false
      end
    end
    return is_two
  end

end
