class PostSerializer < ActiveModel::Serializer
  attributes :title, :content, :author_ip
  cache key: 'post'
  belongs_to :user
end