class CountersController < ApplicationController
  def index
      counters = Counter.all
      render json: CounterSerializer.new(counters).serialized_json
  end
end
