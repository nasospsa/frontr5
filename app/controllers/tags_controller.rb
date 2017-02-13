class TagsController < ApplicationController
  before_action :set_tag, only: [:destroy]

  # GET /tags
  def index
    @tags = Tag.all
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
    redirect_to tags_url, notice: 'Tag was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id])
  end
end
