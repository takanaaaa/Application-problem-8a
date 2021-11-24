class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = current_user
    @book_comment = BookComment.new
    @book_comments = @book.book_comments
  end

  def index
    @book = Book.new
    to = Time.current.at_end_of_day
    from = (to - 1.week).at_beginning_of_day
    @books = Book.includes(:favorited_users).where(created_at: from...to).sort{|a,b| b.favorited_users.size <=> a.favorited_users.size}
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      p @book
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
