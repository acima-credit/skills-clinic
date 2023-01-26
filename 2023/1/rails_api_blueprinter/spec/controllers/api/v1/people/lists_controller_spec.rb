# frozen_string_literal: true

require "rails_helper"

RSpec.describe ::Api::V1::People::ListsController, type: :controller do

  describe "#index" do

    context "success" do
      before { get :index }

      let(:expected_response) { { first_name: "john" } }
      let(:parsed_response) { JSON.parse(response.body).deep_symbolize_keys }

      it "has a successful HTTP status" do
        expect(response).to have_http_status(:success)
      end

      it "renders stuff" do
        expect(parsed_response).to eq(expected_response)
      end
    end

    context "failure" do
    end
  end
end
