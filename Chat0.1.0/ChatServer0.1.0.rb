#MundaneChat 0.1.0 Server:
require 'socket'
require 'resolv'

server = TCPServer.new 9876

loop do
	client = server.accept    # Wait for a client to connect
	client.puts "Hello!"
	client.puts "Time is #{Time.now}"
	client.puts "Welcome to MundaneChat ver 0.1.0"
	shn = Socket.gethostname
	chn = client.getpeername
	
	p "#{chn} has connected" #Puts the client name
	hostcom = Thread.new do 
		#I HEARD YOU LIKED THREADS...
		servcom = Thread.new do #Takes input from server, prints to connected
			puts "Servcom started" # TESTING OUTPUT <---------------------
			status = 1
				until status == "/exit\n"
					status = gets
					client.puts "#{shn}: #{status}"
				end
			servcom.kill
		end
#Input from connected user printed to server
		puts "Hostcom started" #TESTING OUTPUT <--------------------
		status = 1
			until status == "/exit\n"
				status = client.gets
				puts "#{chn}: #{status}"
			end
		puts "BEFORE CLIENT EXIT" #MORE TESTING INFO
		puts "HOSTCOM" #MORE TESTING INFO
		hostcom.kill
	end
	
	hostcom.join
	hostcom.kill
	client.close
end