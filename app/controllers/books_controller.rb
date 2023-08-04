class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  # 以下を追加
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    book.save
    redirect_to 'top'
  end
  
  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
