require "spec_helper"

describe "Segmentação de Leads" do

  before do
    #visitar página
    visit LeadSegmentationPage
  end

  it "lists all segmentation lists created" do
    expect( on(LeadSegmentationPage).segmentation_list_totals ).to match(/1 a 11 de 11/)
  end

  it "searches for a segmentation list" do
    on(LeadSegmentationPage).search_for "bla"
    expect( on(LeadSegmentationPage).segmentation_list_totals ).to match(/1 a 1 de 1 \(filtrado de 11\)/)
  end

  it "allows to create a segmentation list" do
    on(LeadSegmentationPage).create_segmentation
    on(LeadSegmentationCreationPage).new_segmentation_list "test list"
    on(LeadSegmentationPage).search_for "test list"
    expect( on(LeadSegmentationPage).segmentation_list_totals ).to match(/1 a 1 de 1 \(filtrado de 12\)/)
    on(LeadSegmentationPage).confirm(true) do
      on(LeadSegmentationPage).select_item_option "Excluir lista"
    end
  end

  # This will list the leads for the first segmentation on list
  it "lists all leads of one segmentation list" do
    on(LeadSegmentationPage).search_for "Industries"
    on(LeadSegmentationPage).show_leads
    expect(on(LeadsPage).leads_total).to match(/9/)
  end

  #####
  # All test cases from the list of options will be filtering
  # using search so it will have only one option available and make
  # the test easier to understand
  #####
  it "allows edit a segmentation list" do
    on(LeadSegmentationPage).search_for "Bla"
    on(LeadSegmentationPage).select_item_option "Editar"
    expect( on(LeadSegmentationCreationPage).list_name ).to match(/Bla/)
  end

  it "allows duplicate a segmentation list" do
    on(LeadSegmentationPage).search_for "Bla"
    on(LeadSegmentationPage).select_item_option "Duplicar"
    on(LeadSegmentationPage).search_for "Bla enterprise - Duplicado"
    expect( on(LeadSegmentationPage).segmentation_list_totals ).to match(/1 a 1 de 1 \(filtrado de 12\)/)
  end

  #####
  # This test case is here only because I don"t have access to the database
  # it should not be this way - Good test cases runs well isolated
  #####
  it "allows to delete a segmentation list" do
    on(LeadSegmentationPage).search_for "Bla enterprise - Duplicado"
    message = on(LeadSegmentationPage).confirm(true) do
      on(LeadSegmentationPage).select_item_option "Excluir lista"
    end
    expect(message).to match(/tem certeza que deseja apagar esta lista\?/)
  end

  it "allows export a segmentation list" do
    on(LeadSegmentationPage).search_for "Bla"
    on(LeadSegmentationPage).select_item_option "Exportar conversões"
    on(LeadSegmentationPage).fill_export_conversions_modal("gustavo7lagoas@gmail.com", "csv")
    expect(on(LeadSegmentationPage).success_alert).to match(/Arquivo enviado com sucesso/)
  end

  it "allows to delete all Leads from a segmentation list" do
    on(LeadSegmentationPage).search_for "Bla"
    on(LeadSegmentationPage).select_item_option "Apagar Leads"
    expect(on(LeadSegmentationPage).delete_leads_modal_title).to match(/Apagar Leads/)
  end

end

