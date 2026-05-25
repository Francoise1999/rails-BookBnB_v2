class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authorize_owner!, only: [:edit, :update, :destroy]

  def index
    @user = current_user
    @books = Book.all
    if params[:query].present?
      @books = Book.search_by_title_and_author(params[:query])
    end
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Votre livre a été mis à jour"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, status: :see_other
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def authorize_owner!
    unless @book.user == current_user
      redirect_to books_path, alert: 'Action non autorisée.'
    end
  end

  def book_params
    params.require(:book).permit(:title, :description, :author, :category, :year, :price, :photo)
  end
end
