require "socket"

#example: request_line - "GET /?rolls=2&sides=6 HTTP/1.1"
def parse_request(request_line)
	http_method, path_and_params,   = request_line.split(" ")
	path, params = path_and_params.split("?")
	params = params.split("&").each_with_object({}) do |pair, hash|
		key, value = pair.split("=")
		hash[key] = value
	end
	#destructuring assignment
	[http_method, path, params, http]
end


server = TCPServer.new('localhost', 3003)
loop do 
	client = server.accept

	request_line = client.gets
	next if !request_line || request_line =~ /favicon/
	puts request_line

	http_method, path, params, http = parse_request(request_line)
	client.puts "HTTP/1.1 200 OK"
	client.puts "Content-Type: text/plain\r\n\r\n"
	client.puts request_line
	client.puts "params #{params}"

	rolls = params["rolls"].to_i
	sides = params["sides"].to_i

	rolls.times do 
		roll = rand(sides) + 1
		client.puts roll
	end
	client.close
end