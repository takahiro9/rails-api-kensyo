module V1
  class Books < Grape::API
    resources :books do
      desc 'return all books'
      get '/' do
        @books = Book.all
        present @books, with: V1::Entities::BookEntity
      end

      desc 'return a book'
      params do
        requires :id, type: Integer
      end
      get '/:id' do
        @book = Book.find(params[:id])
      end

      desc 'Create a book'
      params do
        requires :title, type: String
        requires :price, type: Integer
        requires :author_id, type: Integer
      end
      post '/' do
        @book = Book.create(
          title: params[:title],
          price: params[:price],
          author_id: params[:author_id]
        )
      end

      desc 'Delete an book'
      params do
        requires :id, type: Integer
      end
      delete '/:id' do
        @book = Book.find(params[:id])
        @book.destroy
      end
    end
  end
end