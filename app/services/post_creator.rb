class PostCreationService
include ActiveModel::Validations 

  attribute :title, String
  attribute :author_ip, String
  validates_presence_of :title, :content

  def execute
    raise ArgumentError.new("Invalid record") unless self.valid?
    response = JSON.parse(
      API::post("/posts", self.attributes),
      :symbolize_names => true
    )
    Post.new(response)
    end
end