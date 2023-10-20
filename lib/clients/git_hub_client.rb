class GitHubClient

  ACCESS_TOKEN = ENV["github_token"].freeze
  SERVER_RESPONSE = 201.freeze

  def initialize
    @client = setup_octokit_client
  end

  def create_gist(params)
    @client.create_gist(params)
  end

  def success?
    @client.last_response.status == SERVER_RESPONSE
  end


  private

  def setup_octokit_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
