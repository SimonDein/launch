=begin
Derives from roll_with_html.rb

Simple emulation of state using "crafted" url's
=end

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

  client.puts "HTTP/1.1 200 OK" # Sends a valid HTTP status for Chrome to function as expected
  client.puts "Content-Type: text/html"
  client.puts ""
  
  http_method, path, params = parse_request(request_line)
  
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts "Method: #{http_method}"
  client.puts "Path: #{path}"
  client.puts "Parameters: #{params}"
  client.puts "</pre>"

  client.puts "<h1>Counter</h1>"

  number = params["number"]
  client.puts "<p>The current number is #{number}</p>"

  client.puts "<p><a href='http://localhost:3003/?number=#{number.to_i + 1}'>Increment counter</a></p>"
  client.puts "<p><a href='http://localhost:3003/?number=#{number.to_i - 1}'>Decrement counter</a></p>"
  
  client.puts "</body>"
  client.puts "</html>"
  client.close
end