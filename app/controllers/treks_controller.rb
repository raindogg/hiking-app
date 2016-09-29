class TreksController < ApplicationController
  def index
    @treks = Trek.where(public: true)
  end

  def new
  end

  def create
    @trek = Trek.create(user_id: current_user.id,
                        title: params[:title],
                        length: params[:length],
                        public: params[:public])

    Point.create(trek_id: @trek.id, 
                 start: true, 
                 end: false,
                 latitude: 50,
                 longitude: 50)

    Point.create(trek_id: @trek.id, 
                 start: false, 
                 end: true,
                 latitude: 50,
                 longitude: 50)

    redirect_to '/'
  end

  def show
    @trek = Trek.find(params[:id])
  end

  def edit
    @trek = Trek.find(params[:id])
  end

  def update
    @trek = Trek.find(params[:id])
    @trek.update(user_id: current_user.id,
                 title: params[:title],
                 length: params[:length],
                 public: params[:public])

    redirect_to "/treks/#{@trek.id}"
  end

  def destroy
    @trek = Trek.find(params[:id])

    @trek.destroy
    flash[:warning] = "Trek removed. Take a hike!"
    redirect_to '/'
  end
end
