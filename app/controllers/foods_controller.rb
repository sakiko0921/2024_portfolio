class FoodsController < ApplicationController
  def new
    @food = Food.new
    @foods = Food.all
  end
end
