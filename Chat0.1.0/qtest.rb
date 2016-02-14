require 'thread'

message_queue = Queue.new

message_in = Thread.new do
	message_queue << "TEST MESSAGE message_in"
end

message_out = Thread.new do
	message_out = "TEST MESSAGE message_out"
	message_queue << message_out
end

message = message_queue.pop

puts message

message_out.join