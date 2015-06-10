require "spec_helper"

describe "Segmentação de Leads" do

  before do
    #visitar página
    visit LeadSegmentationPage
  end

  it "allows to create a segmentation" do
    on(LeadSegmentationPage).create_segmentation
  end



end
