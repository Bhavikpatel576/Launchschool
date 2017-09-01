require "socket"

#example: request_line - "GET /?rolls=2&sides=6 HTTP/1.1"
def parse_request(request_line)
	http_method, path_and_params, http = request_line.split(" ")
	path, params = path_and_params.split("?")
	params = (params || "").split("&").each_with_object({}) do |pair, hash|
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

	next unless request_line

	http_method, path, params, http = parse_request(request_line)
	#1st requirement:status code
	client.puts "HTTP/1.1 200/OK"
	#2nd requirement: single header so browswer knows what is sent back is html code
	client.puts "Content-Type: text/html"
	client.puts
	client.puts "<html>"
	client.puts "<body>"
	client.puts "<pre>"
	client.puts http_method
	client.puts path
	client.puts params
	client.puts http
	client.puts "</pre>"

	client.puts "<h1>Rolls!</h1>"
	rolls = params["rolls"].to_i
	sides = params["sides"].to_i

	client.puts "<h1>Number Count!</h1>"
	number = params["number"].to_i
	client.puts "<p>number roll #{number}</p>"
	client.puts "<a href='?number=#{number + 1}'>Add 1</a>"
	client.puts "<a href='?number=#{number - 1 }'>Subtract 1</a>"
	rolls.times do 
		roll = rand(sides) + 1
		client.puts "<p>",roll, "</p>"
	end

	client.puts "</body>"
	client.puts "</html>"
	client.close
end