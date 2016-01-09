hostn = "NickPC"
hn = hostn
puts "Before thread"
hn = Thread.new do
	puts "User #{hostn} Connected"
end
puts "after thread"
hn.join
hn.kill