module TCX

  class Track

    attr_accessor :points

    def initialize(track)
      @points = []
      track.css("Trackpoint").each do |point|
        point = TrackPoint.new(point)
        @points << point
      end
    end

  end
end
