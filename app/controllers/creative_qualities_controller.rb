class CreativeQualitiesController < ApplicationController
  def index
    @creative_qualities = CreativeQuality.all
  end
end
