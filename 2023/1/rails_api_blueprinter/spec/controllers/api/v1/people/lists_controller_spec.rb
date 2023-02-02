# frozen_string_literal: true

require "rails_helper"

RSpec.describe ::Api::V1::People::ListsController, type: :controller do
  let(:john) { ::Person.create!(first_name: "John", last_name: "Johnson") }
  describe "#index" do
    context "success" do
      # let(:john) { instance_double(::Person) }
      before { get :index }

      let(:expected_response) do
        {
          first_name: john.first_name,
          last_name: john.last_name,
        }
      end
      let(:parsed_response) { JSON.parse(response.body) }

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
