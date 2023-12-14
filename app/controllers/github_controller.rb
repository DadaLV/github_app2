class GithubController < ApplicationController
  require 'faraday'

  def index
  end

  def show
  @github_login = params[:github_login]

    github_client = Faraday.new(url: "#{ENV['GITHUB_API_URL']}")

    response_user = github_client.get("/users/#{github_login}")

    response_repos = github_client.get("/users/#{github_login}/repos")

    if response_user.status == 200 && response_repos.status == 200
      user_info = JSON.parse(response_user.body)
      user_repositories = JSON.parse(response_repos.body)
      
      render json: { user_info: user_info, user_repositories: user_repositories }
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  def search
    github_login = params[:github_login]

  
      @github_data = GithubGraphqlService.get_github_data(github_login)
      puts "#{@github_data}"
      
  end
end
