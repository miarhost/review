class MarkSerializer < ActiveModel::Serializer
  attributes :value
  cache key: 'mark'
  belongs_to :post
end