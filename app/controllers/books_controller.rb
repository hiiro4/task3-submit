class BooksController < ApplicationController
  def index
    @book=Book.new
    @books=Book.all
    @book_user=current_user
    @user=current_user
  end

  def show
    @book=Book.new
    @books=Book.find(params[:id])
    @book_user=User.find_by(id:@books.user_id)
    @user=User.find_by(id:@books.user_id)
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
    redirect_to book_path(@book),notice:"You have created book successfully."
    else
      @books=Book.all
      @book_user=current_user
      @user=current_user
    render:index
    end
  end

  def edit
      @books=Book.find(params[:id])
       redirect_to books_path unless  @books.user_id==current_user.id
  end

  def update
     @books=Book.find(params[:id])
     if @books.update(book_params)
     redirect_to book_path(@books.id),notice:"You have updated book successfully."
     else

       render:edit
     end
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to "/books",notice:"Book was successfully destroyed."
  end

private
def book_params
  params.require(:book).permit(:title,:body)
end
end

