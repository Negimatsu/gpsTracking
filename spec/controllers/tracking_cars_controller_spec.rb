require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TrackingCarsController do

  # This should return the minimal set of attributes required to create a valid
  # TrackingCar. As you add validations to TrackingCar, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "lat" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TrackingCarsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all tracking_cars as @tracking_cars" do
      tracking_car = TrackingCars.create! valid_attributes
      get :index, {}, valid_session
      assigns(:tracking_cars).should eq([tracking_car])
    end
  end

  describe "GET show" do
    it "assigns the requested tracking_car as @tracking_car" do
      tracking_car = TrackingCars.create! valid_attributes
      get :show, {:id => tracking_car.to_param}, valid_session
      assigns(:tracking_car).should eq(tracking_car)
    end
  end

  describe "GET new" do
    it "assigns a new tracking_car as @tracking_car" do
      get :new, {}, valid_session
      assigns(:tracking_car).should be_a_new(TrackingCars)
    end
  end

  describe "GET edit" do
    it "assigns the requested tracking_car as @tracking_car" do
      tracking_car = TrackingCars.create! valid_attributes
      get :edit, {:id => tracking_car.to_param}, valid_session
      assigns(:tracking_car).should eq(tracking_car)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TrackingCar" do
        expect {
          post :create, {:tracking_car => valid_attributes}, valid_session
        }.to change(TrackingCars, :count).by(1)
      end

      it "assigns a newly created tracking_car as @tracking_car" do
        post :create, {:tracking_car => valid_attributes}, valid_session
        assigns(:tracking_car).should be_a(TrackingCars)
        assigns(:tracking_car).should be_persisted
      end

      it "redirects to the created tracking_car" do
        post :create, {:tracking_car => valid_attributes}, valid_session
        response.should redirect_to(TrackingCars.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tracking_car as @tracking_car" do
        # Trigger the behavior that occurs when invalid params are submitted
        TrackingCars.any_instance.stub(:save).and_return(false)
        post :create, {:tracking_car => { "lat" => "invalid value" }}, valid_session
        assigns(:tracking_car).should be_a_new(TrackingCars)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TrackingCars.any_instance.stub(:save).and_return(false)
        post :create, {:tracking_car => { "lat" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested tracking_car" do
        tracking_car = TrackingCars.create! valid_attributes
        # Assuming there are no other tracking_cars in the database, this
        # specifies that the TrackingCar created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        TrackingCars.any_instance.should_receive(:update).with({ "lat" => "MyString" })
        put :update, {:id => tracking_car.to_param, :tracking_car => { "lat" => "MyString" }}, valid_session
      end

      it "assigns the requested tracking_car as @tracking_car" do
        tracking_car = TrackingCars.create! valid_attributes
        put :update, {:id => tracking_car.to_param, :tracking_car => valid_attributes}, valid_session
        assigns(:tracking_car).should eq(tracking_car)
      end

      it "redirects to the tracking_car" do
        tracking_car = TrackingCars.create! valid_attributes
        put :update, {:id => tracking_car.to_param, :tracking_car => valid_attributes}, valid_session
        response.should redirect_to(tracking_car)
      end
    end

    describe "with invalid params" do
      it "assigns the tracking_car as @tracking_car" do
        tracking_car = TrackingCars.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TrackingCars.any_instance.stub(:save).and_return(false)
        put :update, {:id => tracking_car.to_param, :tracking_car => { "lat" => "invalid value" }}, valid_session
        assigns(:tracking_car).should eq(tracking_car)
      end

      it "re-renders the 'edit' template" do
        tracking_car = TrackingCars.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TrackingCars.any_instance.stub(:save).and_return(false)
        put :update, {:id => tracking_car.to_param, :tracking_car => { "lat" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested tracking_car" do
      tracking_car = TrackingCars.create! valid_attributes
      expect {
        delete :destroy, {:id => tracking_car.to_param}, valid_session
      }.to change(TrackingCars, :count).by(-1)
    end

    it "redirects to the tracking_cars list" do
      tracking_car = TrackingCars.create! valid_attributes
      delete :destroy, {:id => tracking_car.to_param}, valid_session
      response.should redirect_to(tracking_cars_url)
    end
  end

end
