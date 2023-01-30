# frozen_string_literal:true

# class Api::V1::People::ListsController

module Api
  module V1
    module People
      class ListsController < ApplicationController
        def index
          render json: { first_name: "john" }
        end
      end
    end
  end
end
