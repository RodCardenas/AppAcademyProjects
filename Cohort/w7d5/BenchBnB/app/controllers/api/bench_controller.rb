class Api::BenchController < ApplicationController
  def index
    puts "here"
    @benches = Bench.all
    render 'api/benches/index'
  end

  def create
    @bench = Bench.new(bench_params)

    @bench.save!
    render json: @bench

  end

  def bench_params
    params.require(:bench).permit(:description, :lat, :lng)
  end
end
