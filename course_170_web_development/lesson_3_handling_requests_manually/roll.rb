# Derives from server.rb (see file for further code comments)

require 'socket'

def parse_request(request_line)
  http_method = request_line.match(/^[A-Z]{3,5}\b/).to_s      # eg. "GET"
  path = request_line.match(/\s\/[\/a-zA-Z]*/).to_s.chomp     # eg. "/"

  params = request_line.scan(/\w+=\d+/)                       # eg. ["roll=2", "sides=6"]
  params.map! { |parameter| parameter.split("=") }            # eg. [["roll", "2"], ["sides", "6"]]
  params = params.to_h                                        # eg. {"roll"=>"2", "sides"=>"6"}

  [http_method, path, params]
end

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/ # next if line is empty or if match (to get around error)
  puts request_line


  
  client.puts "HTTP/1.1 200 OK\r\n\r\n" # Sends a valid HTTP status for Chrome to function as expected
  
  http_method, path, params = parse_request(request_line)
  
  rolls = params["roll"].to_i
  more_than_one = rolls > 1

  client.puts "Method: #{http_method}"
  client.puts "Path: #{path}"
  client.puts "Parameters: #{params}"
  client.puts "Your #{rolls} roll#{more_than_one ? "s" : ""} with"\
              " #{more_than_one ? "" : "a "}#{params["sides"]}-sided #{more_than_one ? "dice" : "die"}:"
  rolls.times do |dice_num|
    roll = rand(params["sides"].to_i) + 1
    client.puts "Dice ##{dice_num + 1}: #{roll}"
  end

  client.close
end