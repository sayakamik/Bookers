class BooksController < ApplicationController
  def top
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
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
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    if @book.destroy  # データ（レコード）を削除
      flash[:notice] = "Book was successfully destroyed."
      redirect_to '/books'  # 投稿一覧画面へリダイレクト
    end
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end