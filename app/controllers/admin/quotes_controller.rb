class Admin::QuotesController < Admin::BaseController
  before_action :set_quote, only: %i[show edit update destroy]

  # GET /admin/quotes
  def index
    @quotes = Quote.order(date: :desc, created_at: :desc)
  end

  # GET /admin/quotes/:id
  def show
  end

  # GET /admin/quotes/new
  def new
    @quote = Quote.new
  end

  # GET /admin/quotes/:id/edit
  def edit
  end

  # POST /admin/quotes
  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to [:admin, @quote], notice: "Quote was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/quotes/:id
  def update
    if @quote.update(quote_params)
      redirect_to [:admin, @quote], notice: "Quote was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  # DELETE /admin/quotes/:id
  def destroy
    @quote.destroy
    redirect_to admin_quotes_path, notice: "Quote was successfully destroyed."
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(
      :title,
      :description,
      :author_id,
      :category,
      :date,
      :explanation,
      :source,
      :image
    )
  end
end
