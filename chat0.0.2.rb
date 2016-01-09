require 'socket'

server = TCPServer.new 9876

loop do
	client = server.accept    # Wait for a client to connect
	client.puts "Hello!"
	client.puts "Time is #{Time.now}"
	client.puts "Welcome to MundaneChat ver 0.0.1"
	hn = Socket.gethostname
	p "#{hn} has connected" #Puts the host name
	status = 1
	servstatus = 1
	until status == "/exit\n";
		message = client.gets
		puts message
		status = message
	end
	until servstatus == "/exit\n"
		smessage = gets
		client.puts smessage
		servstatus = smessage
	end
end