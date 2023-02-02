# frozen_string_literal:true

# class Api::V1::People::ListsController

module Api
  module V1
    module People
      class ListsController < ApplicationController
        def index
          people = Person.all
          binding.pry
          render json: people
        end
      end
    end
  end
end
