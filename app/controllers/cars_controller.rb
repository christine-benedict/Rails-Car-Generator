class CarsController < ApplicationController
  def create

      if params.has_key?(:make) && !params[:make].strip.empty? && params.has_key?(:modelyear) && !params[:modelyear].strip.empty?
          # cookies[:make] = params[:make]
          # cookies[:modelyear] = params[:modelyear]
          car = Car.new(params[:make], params[:modelyear])
          session[:car] = car.to_yaml
          redirect_to "/cars/status"
      else
          render "create"
      end
  end
  def status
      @car = YAML.load(session[:car])
  end

  def accelerate
      @car = YAML.load(session[:car])
      @car.accelerate
      session[:car] = @car.to_yaml
      render "status"
  end

  def brake
      @car = YAML.load(session[:car])
      @car.brake
      session[:car] = @car.to_yaml
      render 'status'
  end

  def lightstoggle
      @car = YAML.load(session[:car])
      @car.lightsToggle
      session[:car] = @car.to_yaml
      render 'status'
  end

  def parkingbraketoggle
      @car = YAML.load(session[:car])
      @car.parkingbrake = params[:parkingbrake]
      session[:car] = @car.to_yaml
      render 'status'
  end

end
