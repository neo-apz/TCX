module TCX

  class TrackPoint

    attr_accessor :time, :latitude, :longitude, :hr_bpm, :distance_meters, :speed, :cadence

    def initialize(point)
      @time = Time.parse(point.at_css("Time"))
      @latitude = point.at_css("Position LatitudeDegrees").text.to_f rescue nil
      @longitude = point.at_css("Position LongitudeDegrees").text.to_f rescue nil
      @hr_bpm = point.at_css("HeartRateBpm Value").text.to_i rescue nil
      @distance_meters = point.at_css("DistanceMeters").text.to_f rescue nil
      @speed = point.at_css("Speed").text.to_f rescue nil
      @cadence = point.at_css("RunCadence").text.to_i rescue nil
    end

  end
end
