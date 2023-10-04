require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns a new order" do
      get :new
      expect(assigns(:order)).to be_a_new(Order)
    end

    it "assigns ingredients in ascending order" do
      ingredient1 = create(:ingredient, name: "Ingredient B")
      ingredient2 = create(:ingredient, name: "Ingredient A")

      get :new
      expect(assigns(:ingredients)).to eq([ingredient2, ingredient1])
    end
  end

  describe "POST #create" do
    let(:valid_params) { { order: { ingredient_ids: [ingredient.id] } } }
    let(:valid_empty_params) { { order: { ingredient_ids: [''] } } }
    let(:ingredient) { create(:ingredient) }

    it "creates a new order with valid params" do
      expect {
        post :create, params: valid_params
      }.to change(Order, :count).by(1)
      expect(flash[:notice]).to eq(I18n.t('orders.create.notice'))
      expect(response).to redirect_to(root_path)
    end

    it "creates a new order with empty params" do
      expect {
        post :create, params: valid_empty_params
      }.to change(Order, :count).by(1)
      expect(flash[:notice]).to eq(I18n.t('orders.create.notice'))
      expect(response).to redirect_to(root_path)
    end
  end
end
