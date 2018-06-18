require "sinatra"
require "thin"

set :server, :thin
set :port, 4000
set :bind, "0.0.0.0"
set :environment, :production

get "/" do
	content_type :json
	@status = system("ls")
	{ :message => "Hello World!", :exitCode => $?.exitstatus, :status => @status }.to_json
end

get "/api/v1/:id" do
	content_type :json
	@status = false
	if params['id'] == "12345"
		puts "Here we go!"
		@status = system("/etc/periodic/_drafts/pullandbuild")
	end
	{ :id => params['id'], :status => @status }.to_json
end

