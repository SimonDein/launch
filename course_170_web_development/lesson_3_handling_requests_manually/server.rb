require 'socket'

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_string = client.gets
  puts request_string # prints to console
  
  client.puts "HTTP/1.1 200 OK\r\n\r\n" # Sends a status code to client (browser) which isn't shown in browser
  client.puts request_string  # This is the string printed in the browser
  client.close
end