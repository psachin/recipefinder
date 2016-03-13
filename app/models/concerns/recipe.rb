class Recipe
  include HTTParty

  key_value = ENV['FOOD2FORK_KEY'] || '620901e5cb6ffb7b7fec7dc7721f3e28'
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'food2fork.com'
  base_uri "http://#{hostport}/api"
  default_params key: key_value
  format :json

  def self.for keyword
    get("/search", query: { q: keyword})["recipes"]
  end
end
