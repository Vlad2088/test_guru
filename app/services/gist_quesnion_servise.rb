class GistQuesnionServise

  ACCESS_TOKEN = ENV["github_token"].freeze
  SERVER_RESPONSE = 201.freeze

  GistObject = Struct.new(:url, :status_server) do
  
    def success?
      status_server == SERVER_RESPONSE
    end
  end

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def call
    @client.create_gist(gist_params)
    GistObject.new(@client.last_response.data[:html_url], @client.last_response.status)
  end

  private


  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      'public': true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      },
      headers: {
        'X-GitHub-Api-Version': '2022-11-28'
      }
    } 
  end
  
  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

end


