module TCX

  class Activity

    attr_accessor :sport, :laps, :activity_id

    def initialize(activity)
      @sport = activity["Sport"] rescue ""
      @activity_id = activity.at_css("Id")
      @laps = []
      activity.css("Lap").each do |lap|
        lap = Lap.new(lap)
        @laps << lap
      end
    end

  end

end
