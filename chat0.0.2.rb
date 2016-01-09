#MundaneChat 0.0.2: Now with 2 way communication!
require 'socket'

server = TCPServer.new 9876

loop do
	client = server.accept    # Wait for a client to connect
	client.puts "Hello!"
	client.puts "Time is #{Time.now}"
	client.puts "Welcome to MundaneChat ver 0.0.2"
	hn = Socket.gethostname
	p "#{hn} has connected" #Puts the host name
	
	hostcom = Thread.new do
		puts "Hostcom started" #TESTING OUTPUT <--------------------
		status = 1
	until status == "/exit\n"
		status = client.gets
		puts status
	end
	hostcom.kill
	end
	
	servcom = Thread.new do
		puts "Servcom started" # TESTING OUTPUT <---------------------
		status = 1
	until status == "/exit\n"
		status = gets
		client.puts status
	end
	servcom.kill
	end
end
