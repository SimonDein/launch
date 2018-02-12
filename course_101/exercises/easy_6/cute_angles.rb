# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds.
# You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds.
# A degree has 60 minutes, while a minute has 60 seconds.

DEGREE = "\xC2\xB0"
ARC_MINUTE = 60
ARC_SECOND = 60

def dms(degrees_float)
  total_seconds = degrees_float * ARC_MINUTE * ARC_SECOND
  degree, rest_seconds = total_seconds.divmod(ARC_MINUTE * ARC_SECOND)
  arc_minutes, arc_seconds = rest_seconds.divmod(ARC_MINUTE)

  "#{degree}#{DEGREE}#{format("%02d'%02d\"", arc_minutes, arc_seconds)}"
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(0) == %(0°00'00")
puts dms(93.034773) == %(93°02'05")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")