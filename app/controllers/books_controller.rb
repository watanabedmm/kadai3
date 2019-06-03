class BooksController < ApplicationController
	  def top
  end
  def show
    @bookn = Book.new
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new

  end

  def new
  	@book =Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book.id)
       flash[:success] = "You have creatad book successfully."
    else
      @books = Book.all
      render :index

     end

  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
       @books = Book.all
       render :index
    end
  end
  def update
    @book = Book.find(params[:id])
     @book.user_id = current_user.id
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:success] =  "You have updated book successfully."
    else
      render :edit
    end
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
   private
    def book_params
      params.require(:book).permit(:title, :opinion)
    end
  end
