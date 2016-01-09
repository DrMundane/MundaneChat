#require 'socket'

#server = TCPServer.new 2000

#loop do
  #Thread.start(server.accept) do |client|
	#hostname = Socket.gethostname
	#p "#{hostname} has connected."  
    #client.puts "Hello !"
    #client.puts "Time is #{Time.now}"
    #client.close
	#p "#{hostname} has been disconnected."
  #end
#end


#require 'socket'
#server = TCPServer.new 2000 # Server bound to port 2000

#loop do
	#client = server.accept    # Wait for a client to connect
	#client.puts "Hello !"
	#client.puts "Time is #{Time.now}"
	#client.puts "Butts"
	#hn = Socket.gethostname
	#p hn #Puts the host name
	#client.close
#end

#----------^^^^^^^^^^INSPIRATION^^^^^^^^^^__________#

# FAILURE NO 1, COMS NOT 2 WAY, SWITCHING TO THREADS?
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