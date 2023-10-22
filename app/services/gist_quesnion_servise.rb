class GistQuesnionServise

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    gist_object
  end

  private

  def gist_object
    Struct.new('GistObject', :url, :success)
    response = @client.create_gist(gist_params)
    Struct::GistObject.new(response.html_url, @client.success?)
  end

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


