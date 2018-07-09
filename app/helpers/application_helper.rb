module ApplicationHelper
  def mock_creative_quality_scores
    scores = [67, -25, 67]
    data = []

    CreativeQuality
      .limit(3)
      .each_with_index do |creative_quality, i|
      data << creative_quality.as_json.merge(
        score: scores[i]
      )
    end

    data
  end
end
