#MundaneChat 0.1.0 Server:
require 'socket'

server = TCPServer.new 9876

loop do
	client = server.accept
	client.puts "Hello!\nTime is #{Time.now}\nWelcome to MundaneChat ver 0.1.0"
	shn = Socket.gethostname
	chn = client.getpeername
	message_out = Thread.new do
		message = "1"
		until message == "/exit"
			send_message = gets.chomp
			client.puts "#{shn}: #{send_message}"
		end
	client.close_write
	client.close_read
	end

	message_in = Thread.new do
		loop do
		rec_message = client.readline.chomp
		puts rec_message
		end
	end
message_out.join
message_out.kill
message_in.kill
end