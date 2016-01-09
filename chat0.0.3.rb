#MundaneChat 0.0.3:
require 'socket'

server = TCPServer.new 9876

loop do
	client = server.accept    # Wait for a client to connect
	client.puts "Hello!"
	client.puts "Time is #{Time.now}"
	client.puts "Welcome to MundaneChat ver 0.0.3"
	hn = Socket.gethostname
	p "#{hn} has connected" #Puts the host name
	
	hostcom = Thread.new do
		#I HEARD YOU LIKED THREADS...
		servcom = Thread.new do
			puts "Servcom started" # TESTING OUTPUT <---------------------
			status = 1
				until status == "/exit\n"
					status = gets
					client.puts status
				end
			servcom.kill
		end
		
		puts "Hostcom started" #TESTING OUTPUT <--------------------
		status = 1
			until status == "/exit\n"
				status = client.gets
				puts status
			end
		puts "BEFORE CLIENT EXIT"
		puts "HOSTCOM"
		hostcom.kill
	end
	
	hostcom.join
	hostcom.kill
	client.close
end