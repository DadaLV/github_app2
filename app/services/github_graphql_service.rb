class GithubGraphqlService
  require 'faraday'

  def self.get_github_data(github_login)
    github_client = Faraday.new(url: "#{ENV['GITHUB_API_URL']}")
    @my_github_login = github_login
    response_user = github_client.get("/users/#{github_login}")
    response_repos = github_client.get("/users/#{github_login}/repos")

    if response_user.status == 200 && response_repos.status == 200
      response_user_data = JSON.parse(response_user.body)
      user_info = response_user_data['name']
      user_repositories_data = JSON.parse(response_repos.body)
      repositories_names = user_repositories_data.map { |repo| repo['name'] }

      {
        name: user_info,
        repositories_names: repositories_names
      }
    else
      {
        error: 'User not found'
      }
    end
  end
end
