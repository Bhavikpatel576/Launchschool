require 'socket'

#simple program doesn't work because of browser updates. Chrome
#wants a well formatted response 
server = TCPServer.new('localhost', 3003)
loop do 
	client = server.accept

	requestline = client.gets
	puts requestline

	client.puts requestline
	client.puts "HTTP/1.1 200 OK"
	client.puts "Content-Type: text/plain\r\n\r\n"
	client.close
end