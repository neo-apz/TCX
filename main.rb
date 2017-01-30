require File.join(File.dirname(__FILE__), 'tcx')


sample_file = File.join(File.dirname(__FILE__), "samples/sample1.tcx")

tcx_db = TCX::TcxDB.new(File.open(sample_file))

puts tcx_db.activities[0].laps[0].tracks[0].points[0].time