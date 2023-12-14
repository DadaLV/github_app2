module Types
  class GithubUserType < Types::BaseObject
    description "A GitHub user"
    
    field :name, String, null: true, description: "The name of the GitHub user"
    field :repositories, [Types::RepositoryType], null: true, description: "List of GitHub user's repositories"
  end
end