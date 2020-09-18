require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(filename)
  athlete_array = []
  required_fields = %w[ID Name Height Team Year City Sport Event Medal]

  CSV.read(filename, headers: true).map { |row| row.to_h }.each do |athlete|
    athlete_array << athlete.select {|k, v| required_fields.include?(k)}
  end

  return athlete_array
end




def total_medals_per_team(olympic_data)
  medalists = []
  medal_count = {}

  olympic_data.each do |athlete|
    if athlete["Medal"] != "NA"
      medalists << athlete
    end
  end
  medalists.each do |medalist|
    country = medalist["Team"]
    if medal_count.key?(country)
      medal_count[country] += 1
    else
      medal_count[country] = 1
    end
  end
  return medal_count
end

def get_all_gold_medalists(olympic_data)
  gold_medalists = []
  olympic_data.each do |athlete|
    if athlete["Medal"] == "Gold"
      gold_medalists << athlete
    end
  end
  return gold_medalists
end
# get_all_olympic_athletes('../data/athlete_events1.csv' )