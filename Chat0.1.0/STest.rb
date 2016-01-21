require 'socket'

server = TCPServer.new 9876

loop do
client = server.accept
	client.puts "Hello!\nTime is #{Time.now}\nWelcome to MundaneChat ver 0.1.0"
	message = client.recvfrom(666)
	puts message
end