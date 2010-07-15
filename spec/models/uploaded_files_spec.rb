require File.dirname(__FILE__) + '/../spec_helper'

describe UploadedFiles do
  before(:each) do
    @uploaded_files = UploadedFiles.new
  end

  it "should be valid" do
    @uploaded_files.should be_valid
  end
end
