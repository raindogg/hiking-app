class TreksController < ApplicationController
  def index
    @page_title = "Wandr - Take a Hike"
    sort_order = params[:sort_order]
    sort_attribute = params[:sort_attribute]
    sort_length = params[:sort_length]
    search_term = params[:search_term]

    @treks = Trek.where(public: true).order(created_at: :desc)
    @list_title = "All Treks"

    if sort_order
      @treks = Trek.where(public: true).order(:created_at)
    elsif sort_attribute
      @treks = Trek.where(public: true).order(:length)
    elsif sort_length
      @treks = Trek.where(public: true).order(length: :desc)
    end

    if search_term
      fuzzy_search_term = "%#{search_term}%"
      @treks = @treks.where("title ILIKE ? OR location ILIKE ?", fuzzy_search_term, fuzzy_search_term)
      @list_title = "All treks matching #{search_term}"
    end
  end

  def new
  end

  def create
    @trek = Trek.create(user_id: params[:user_id],
                        title: params[:title],
                        length: params[:length],
                        public: params[:public])

    redirect_to "/treks/#{@trek.id}"
  end

  def show
    @trek = Trek.find(params[:id])
    @page_title = @trek.title
    key = ENV['DIGITAL_GLOBE_KEY']
    @map = "https://api.mapbox.com/v4/digitalglobe.nal0g75k/geojson(%7B%22type%22%3A%22Feature%22%2C%22properties%22%3A%7B%22stroke-width%22%3A6%2C%22stroke%22%3A%22%23ff4444%22%2C%22stroke-opacity%22%3A0.8%7D%2C%22geometry%22%3A%7B%22type%22%3A%22LineString%22%2C%22coordinates%22%3A%5B%5B-86.473346%2C39.321728%5D%2C%5B-86.476736%2C39.323006%5D%5D%7D%7D)/-86.476736,39.323056,16/500x300.jpg90?access_token=#{key}"
  end

  def edit
    @trek = Trek.find(params[:id])
    @page_title = "Edit #{@trek.title}"
  end

  def update
    @trek = Trek.find(params[:id])
    @trek.update(title: params[:title],
                 public: params[:public],
                 description: params[:description])

    redirect_to "/treks/#{@trek.id}"
  end

  def image
    @trek = Trek.find(params[:id])
    call = @trek.generate_url(params[:zoom])
    @trek.image_from_url(call)
    @trek.save
    redirect_to "/treks/#{@trek.id}"
  end

  def imageupdate
    @trek = Trek.find(params[:id])
  end

  def destroy
    @trek = Trek.find(params[:id])

    @trek.destroy
    flash[:warning] = "Trek removed. Take a hike!"
    redirect_to '/'
  end
end
