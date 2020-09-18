require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(filename)
  athlete_array = []

  CSV.read(filename, headers: true).each do |athlete|
    athlete_array << {"ID" => athlete["ID"],
                     "Name" => athlete["Name"],
                     "Height" => athlete["Height"],
                     "Team" => athlete["Team"],
                     "Year" => athlete["Year"],
                     "City" => athlete["City"],
                     "Sport" => athlete["Sport"],
                     "Event" => athlete["Event"],
                      "Medal" => athlete["Medal"]}
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

# total_medals_per_team(get_all_olympic_athletes('../data/athlete_events1.csv' ))