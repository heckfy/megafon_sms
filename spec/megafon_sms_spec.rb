# frozen_string_literal: true

RSpec.describe MegafonSms::Client do
  before(:all) do
    @client = described_class.new "MSK_nprsnl", "4Ru50QCX"
  end

  it "should send sms" do
    VCR.use_cassette("success") do
      @client.send from: "Site.ru", to: "79772695370", message: "Сообщение"
    end
    expect(@client.success?).to eq(true)
  end

  it "should not send sms" do
    VCR.use_cassette("failure") do
      @client.send from: "Site.ru", to: "9772695370", message: "Сообщение"
    end
    expect(@client.failure?).to eq(true)
  end
end
