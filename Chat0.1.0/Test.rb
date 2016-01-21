require 'socket'

server = TCPSocket.new("localhost", 9876)

rec_message = server.recvfrom(666)

puts rec_message

message = gets

server.write message