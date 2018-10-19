require_relative "../lib/nasa_api"

describe "NASA Api" do
  context "Neo Feed" do
    before(:all) do
      @neo_feed_service = Nasa_API.new.Neo_Feed_service
    end

    it "Should return the hash as length of 3" do
      expect(@neo_feed_service.length_of_hash).to eq 3
    end
    it "Should return links hash as length of 3" do
      expect(@neo_feed_service.length_of_inner_hash "links").to eq 3
    end
    it "Should return next in links as a String" do
      expect(@neo_feed_service.get_object_type_in_links "next").to eq String
    end
    it "Should return prev in links as a String" do
      expect(@neo_feed_service.get_object_type_in_links "prev").to eq String
    end
    it "Should return self in links as a String" do
      expect(@neo_feed_service.get_object_type_in_links "self").to eq String
    end
    it "Should return element_count as an Integer" do
      expect(@neo_feed_service.get_object_type "element_count").to eq Integer
    end
    it "Should return near_earth_objects as a Hash" do
      expect(@neo_feed_service.get_object_type "near_earth_objects").to eq Hash
    end
    it "Should return the total number of elements in near_earth_objects to the number in element_count" do
      expect(@neo_feed_service.is_number_of_nearearthobjects_correct?).to eq true
    end
    it "Should return each day in near_earth_objects as an Array" do
      expect(@neo_feed_service.get_object_type_in_nearearthobjects "2018-03-25").to eq Array
      expect(@neo_feed_service.get_object_type_in_nearearthobjects "2018-03-24").to eq Array
    end
    it "Should return links in each element of each day as a Hash" do
      expect(@neo_feed_service.is_object_type_in_element_of_day "links",Hash).to eq true
    end
    it "Should return id in each element of each day as a String" do
      expect(@neo_feed_service.is_object_type_in_element_of_day "id",String).to eq true
    end
    it "Should return neo_reference_id in each element of each day as a String" do
      expect(@neo_feed_service.is_object_type_in_element_of_day "neo_reference_id",String).to eq true
    end
    it "Should return name in each element of each day as a String" do
      expect(@neo_feed_service.is_object_type_in_element_of_day "name",String).to eq true
    end
    it "Should return nasa_jpl_url in each element of each day as a String" do
      expect(@neo_feed_service.is_object_type_in_element_of_day "nasa_jpl_url",String).to eq true
    end
    it "Should return absolute_magnitude_h in each element of each day as a Float" do
      expect(@neo_feed_service.is_object_type_in_element_of_day "absolute_magnitude_h",Float).to eq true
    end
    it "Should return estimated_diameter in each element of each day as a Hash" do
      expect(@neo_feed_service.is_object_type_in_element_of_day "estimated_diameter",Hash).to eq true
    end
    # it "Should return is_potentially_hazardous_asteroid in each element of each day as a Boolean" do
    #   expect(@neo_feed_service.is_object_type_in_element_of_day "is_potentially_hazardous_asteroid",Boolean).to eq true
    # end
    it "Should return close_approach_data in each element of each day as a String" do
      expect(@neo_feed_service.is_object_type_in_element_of_day "close_approach_data",Array).to eq true
    end
    it "Should return estimated_diameter as a length of 4" do
      expect(@neo_feed_service.is_length_of_estimated_diameter_4).to eq true
    end
    it "Should return kilometers in estimated_diameter as a length of 2" do
      expect(@neo_feed_service.is_length_of_hash_in_estimated_diameter_2 "kilometers").to eq true
    end
    it "Should return meters in estimated_diameter as a length of 2" do
      expect(@neo_feed_service.is_length_of_hash_in_estimated_diameter_2 "meters").to eq true
    end
    it "Should return miles in estimated_diameter as a length of 2" do
      expect(@neo_feed_service.is_length_of_hash_in_estimated_diameter_2 "miles").to eq true
    end
    it "Should return feet in estimated_diameter as a length of 2" do
      expect(@neo_feed_service.is_length_of_hash_in_estimated_diameter_2 "feet").to eq true
    end
    it "Should return estimated_diameter_min in kilometers of each element as a Float" do
      expect(@neo_feed_service.is_estimated_diameters_float "kilometers","estimated_diameter_min").to eq true
    end
    it "Should return estimated_diameter_max in kilometers of each element as a Float" do
      expect(@neo_feed_service.is_estimated_diameters_float "kilometers","estimated_diameter_max").to eq true
    end
    it "Should return estimated_diameter_min in meters of each element as a Float" do
      expect(@neo_feed_service.is_estimated_diameters_float "meters","estimated_diameter_min").to eq true
    end
    it "Should return estimated_diameter_max in meters of each element as a Float" do
      expect(@neo_feed_service.is_estimated_diameters_float "meters","estimated_diameter_max").to eq true
    end
    it "Should return estimated_diameter_min in miles of each element as a Float" do
      expect(@neo_feed_service.is_estimated_diameters_float "miles","estimated_diameter_min").to eq true
    end
    it "Should return estimated_diameter_max in miles of each element as a Float" do
      expect(@neo_feed_service.is_estimated_diameters_float "miles","estimated_diameter_max").to eq true
    end
    it "Should return estimated_diameter_min in feet of each element as a Float" do
      expect(@neo_feed_service.is_estimated_diameters_float "feet","estimated_diameter_min").to eq true
    end
    it "Should return estimated_diameter_max in feet of each element as a Float" do
      expect(@neo_feed_service.is_estimated_diameters_float "feet","estimated_diameter_max").to eq true
    end
    it "Should return close_approach_date in close_approach_data as a String" do
      expect(@neo_feed_service.is_object_type_in_close_approach_data "close_approach_date",String).to eq true
    end
    it "Should return epoch_date_close_approach in close_approach_data as a Integer" do
      expect(@neo_feed_service.is_object_type_in_close_approach_data "epoch_date_close_approach",Integer).to eq true
    end
    it "Should return relative_velocity in close_approach_data as a Hash" do
      expect(@neo_feed_service.is_object_type_in_close_approach_data "relative_velocity",Hash).to eq true
    end
    it "Should return miss_distance in close_approach_data as a Hash" do
      expect(@neo_feed_service.is_object_type_in_close_approach_data "miss_distance",Hash).to eq true
    end
    it "Should return orbiting_body in close_approach_data as a String" do
      expect(@neo_feed_service.is_object_type_in_close_approach_data "orbiting_body",String).to eq true
    end
  end
end
