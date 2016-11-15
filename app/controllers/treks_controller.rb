class TreksController < ApplicationController
  def index
    @page_title = "Wandr - Take a Hike"
    sort_order = params[:sort_order]
    sort_attribute = params[:sort_attribute]
    sort_length = params[:sort_length]
    search_term = params[:search_term]
    search_category = params[:category]

    @treks = Trek.where(public: true).order(created_at: :desc)
    @list_title = "All Treks"
    @categories = Category.unique_categories

    if sort_order
      @treks = Trek.where(public: true).order(:created_at)
      @list_title = "All Treks, Oldest to Newest"
    elsif sort_attribute
      @treks = Trek.where(public: true).order(:length)
      @list_title = "All treks, Shortest to Longest"
    elsif sort_length
      @treks = Trek.where(public: true).order(length: :desc)
      @list_title = "All Treks, Longest to Shortest"
    elsif search_category
      categories = Category.where(name: search_category)
      @treks = []
      categories.each do |category|
        @treks << category.treks.all
      end
      @treks.flatten!
      @list_title = "All #{search_category} Treks"
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
