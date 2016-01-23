#MundaneChat 0.1.0:
require 'socket'

server_address = "localhost" #CHANGE THIS (INPUT FROM CMD? FROM FILE?)

server = TCPSocket.new(server_address, 9876)

chn = Socket.gethostname
message_out = Thread.new do
	send_message = "1"
	until send_message == "/exit"
		send_message = gets.chomp
		server.puts "#{chn}: #{send_message}"
	end
	server.close_write
	server.close_read
end

message_in = Thread.new do
	loop do
	rec_message = server.readline.chomp
	puts rec_message
	end
end

message_out.join
message_out.kill
message_in.kill
