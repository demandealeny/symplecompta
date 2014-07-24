require 'rails_helper'

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

RSpec.describe IncomesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Income. As you add validations to Income, be sure to
  # adjust the attributes here as well.
  before do
    user = FactoryGirl.create(:user)
    request.env['HTTP_AUTHORIZATION'] = token_header(user.authentication_token)
  end

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:income)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:income_invalid)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IncomesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all incomes as @incomes" do
      Income.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime::JSON)
    end
  end

  describe "GET show" do
    xit "assigns the requested income as @income" do
      income = Income.create! valid_attributes
      get :show, {:id => income.to_param}, valid_session
      expect(assigns(:income)).to eq(income)
    end
  end

  describe "GET new" do
    xit "assigns a new income as @income" do
      get :new, {}, valid_session
      expect(assigns(:income)).to be_a_new(Income)
    end
  end

  describe "GET edit" do
    xit "assigns the requested income as @income" do
      income = Income.create! valid_attributes
      get :edit, {:id => income.to_param}, valid_session
      expect(assigns(:income)).to eq(income)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Income" do
        expect {
          post :create, {:income => valid_attributes}, valid_session
        }.to change(Income, :count).by(1)
        expect(response).to have_http_status(201)
        expect(response.content_type).to eq(Mime::JSON)
      end

      it "assigns a newly created income as @income" do
        post :create, {:income => valid_attributes}, valid_session
        expect(assigns(:income)).to be_a(Income)
        expect(assigns(:income)).to be_persisted
      end

      xit "redirects to the created income" do
        post :create, {:income => valid_attributes}, valid_session
        expect(response).to redirect_to(Income.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved income as @income" do
        post :create, {:income => invalid_attributes}, valid_session
        expect(assigns(:income)).to be_a_new(Income)
      end

      it "re-renders the 'new' template" do
        post :create, {:income => invalid_attributes}, valid_session
        expect(response).to have_http_status(422)
        expect(response.content_type).to eq(Mime::JSON)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:new_attributes_income)
      }

      it "updates the requested income" do
        income = FactoryGirl.create(:income)
        put :update,
              :id => income.to_param,
              :income => new_attributes
        expect{income.reload}
        .to change{income.title}
        .from(valid_attributes[:title])
        .to(new_attributes[:title])
      end

      it "assigns the requested income as @income" do
        income = Income.create! valid_attributes
        put :update, {:id => income.to_param, :income => valid_attributes}, valid_session
        expect(assigns(:income)).to eq(income)
      end

      xit "redirects to the income" do
        income = Income.create! valid_attributes
        put :update, {:id => income.to_param, :income => valid_attributes}, valid_session
        expect(response).to redirect_to(income)
      end
    end

    describe "with invalid params" do
      it "assigns the income as @income" do
        income = Income.create! valid_attributes
        put :update, {:id => income.to_param, :income => invalid_attributes}, valid_session
        expect(assigns(:income)).to eq(income)
      end

      it "re-renders the 'edit' template" do
        income = Income.create! valid_attributes
        put :update, {:id => income.to_param, :income => invalid_attributes}, valid_session
        expect(response).to have_http_status(422)
        expect(response.content_type).to eq(Mime::JSON)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested income" do
      income = Income.create! valid_attributes
      expect {
        delete :destroy, {:id => income.to_param}, valid_session
      }.to change(Income, :count).by(-1)
    end

    it "redirects to the incomes list" do
      income = Income.create! valid_attributes
      delete :destroy, {:id => income.to_param}, valid_session
      expect(response).to have_http_status(204)
    end
  end

end
