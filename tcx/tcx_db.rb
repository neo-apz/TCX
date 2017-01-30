module TCX

  class TcxDB
    attr_accessor :activities

    def initialize(file)
      if file.is_a?(File)
        puts 'Loading the TCX DB from file <' + file.path + '> !'
        @tcx=Nokogiri::XML(File.open(file)).remove_namespaces!
      else
        puts 'Loading the TCX DB from an input string!'
        @tcx=Nokogiri::XML(file).remove_namespaces!
      end
      @activities = []
      @tcx.css("Activity").each do |activity|
        activity = Activity.new(activity)
        @activities << activity
      end
    end


  end
end
