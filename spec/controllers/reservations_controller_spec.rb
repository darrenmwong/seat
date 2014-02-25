require 'spec_helper'

describe ReservationsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
  
    it "returns http success" do
      get 'create'
      response.should be_success
    end

    it "should return the values made" do
      params[:date] = Tue, 25 Feb 2014 19:30:00 UTC +00:00
      params[:party_size] = 2
      post '/reservations'
      Reservation.last.date.should == params[:date]

        end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update'
      response.should be_success
    end
  end

  describe "GET 'delete'" do
    it "returns http success" do
      get 'delete'
      response.should be_success
    end
  end

end
