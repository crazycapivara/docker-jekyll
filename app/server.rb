require "sinatra"
require "thin"

set :server, :thin
set :environment, :production
set :port, 4000
set :bind, "0.0.0.0"

get "/" do
	content_type :json
	@code = system("ls")
	{ :status => "Hello World", :exitCode => $?.exitstatus, :code => @code }.to_json
end

get "/api/v1/:id" do
	content_type :json
	if params['id'] == "123"
		system("ls")
		puts "fine"
	end
	{ :status => "OK", :id => params['id'] }.to_json
end

