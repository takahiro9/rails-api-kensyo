module V1
  module Entities
    class BookEntity < Grape::Entity
      root 'hoges', 'hoge'
      expose :id
      expose :title
      expose :price
      expose :tax_included_price do |instance, options|
        instance.price * 1.08
      end
      expose :author, using: V1::Entities::AuthorEntity
    end
  end
end