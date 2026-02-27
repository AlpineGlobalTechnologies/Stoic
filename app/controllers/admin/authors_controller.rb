class Admin::AuthorsController < Admin::BaseController
  before_action :set_author, only: %i[ show new edit update destroy ]

  # GET /authors or /authors.json
  def index
    @authors = Author.all
  end

  # GET /authors/1 or /authors/1.json
  def show
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit

  end

  # POST /authors or /authors.json
  def create
    @author = Author.new(author_params)
  end

  # PATCH/PUT /authors/1 or /authors/1.json
  def update
    @author.update!(author_params)
  end

  # DELETE /authors/1 or /authors/1.json
  def destroy
  if @author.destroy
    redirect_to admin_authors_path, notice: "Author deleted."
  else
    redirect_to admin_authors_path, alert: @author.errors.full_messages.to_sentence
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.expect(author: [ :name, :bio ])
    end
end
