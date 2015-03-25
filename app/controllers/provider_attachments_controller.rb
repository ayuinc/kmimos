class ProviderAttachmentsController < ApplicationController
  before_action :set_provider_attachment, only: [:show, :edit, :update, :destroy]

  # GET /provider_attachments
  # GET /provider_attachments.json
  def index
    @provider_attachments = ProviderAttachment.all
  end

  # GET /provider_attachments/1
  # GET /provider_attachments/1.json
  def show
  end

  # GET /provider_attachments/new
  def new
    @provider_attachment = ProviderAttachment.new
  end

  # GET /provider_attachments/1/edit
  def edit
  end

  # POST /provider_attachments
  # POST /provider_attachments.json
  def create
    @provider_attachment = ProviderAttachment.new(provider_attachment_params)

    respond_to do |format|
      if @provider_attachment.save
        format.html { redirect_to @provider_attachment, notice: 'Provider attachment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @provider_attachment }
      else
        format.html { render action: 'new' }
        format.json { render json: @provider_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provider_attachments/1
  # PATCH/PUT /provider_attachments/1.json
  def update
    respond_to do |format|
      if @provider_attachment.update(provider_attachment_params)
        format.html { redirect_to @provider_attachment, notice: 'Provider attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @provider_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provider_attachments/1
  # DELETE /provider_attachments/1.json
  def destroy
    @provider_attachment.destroy
    respond_to do |format|
      format.html { redirect_to provider_attachments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider_attachment
      @provider_attachment = ProviderAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_attachment_params
      params.require(:provider_attachment).permit(:provider_id, :photo)
    end
end
