class PostCreator
include ActiveModel::Validations 

  attr_accessor :post
  validates_presence_of :title, :content
  
  def initialize(post)
    @post = post
  end


  def execute
    raise ArgumentError.new("Invalid record") unless self.valid?
    response = JSON.parse(
      API::post("/posts", self.attributes),
      :symbolize_names => true
    )
    @post = Post.new(response)
    end
end