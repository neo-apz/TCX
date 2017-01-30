module TCX

  class Lap

    attr_accessor :start_time, :total_time_seconds, :distance_meters, :calories, :max_speed, :avg_hr_bpm, :max_hr_bpm, :intensity, :trigger_method, :tracks

    def initialize(lap)
      @start_time = Time.parse(lap["StartTime"])
      @total_time_seconds = lap.at_css("TotalTimeSeconds").text.to_f rescue nil
      @distance_meters = lap.at_css("DistanceMeters").text.to_f rescue nil
      @max_speed = lap.at_css("MaximumSpeed").text.to_f rescue nil
      @calories = lap.at_css("Calories").text.to_i rescue nil
      @avg_hr_bpm = lap.at_css("AverageHeartRateBpm Value").text.to_i rescue nil
      @max_hr_bpm = lap.at_css("MaximumHeartRateBpm Value").text.to_i rescue nil
      @intensity = lap.at_css("Intensity").text rescue nil
      @trigger_method = lap.at_css("TriggerMethod").text rescue nil
      @tracks = []
      lap.css("Track").each do |track|
        track = Track.new(track)
        @tracks << track
      end
    end
  end
end
