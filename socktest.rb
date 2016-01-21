require 'socket'
server = TCPServer.new 2000 # Server bound to port 2000

accept_loop(2000)

puts clientinfo

#loop do
#	client = server.accept    # Wait for a client to connect
#	client.puts "Hello !"
#	client.puts "Time is #{Time.now}"
#	client.puts "Butts"
#	hn = Socket.gethostname
#	p hn #Puts the host name
#	client.close
#end