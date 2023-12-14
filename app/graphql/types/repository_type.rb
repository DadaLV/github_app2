module Types
  class RepositoryType < Types::BaseObject
    description "A GitHub repository"
    
    field :name, String, null: true, description: "The name of the repository"
  end
end