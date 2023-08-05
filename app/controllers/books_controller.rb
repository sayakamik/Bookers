class BooksController < ApplicationController
  def new              #フォーム表示
    @book = Book.new   #フォーム作成
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end
  
  def index
    @books = Book.all
    @book = Book.new  #indexに投稿フォームも記載のため
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
