require 'rails_helper'
require 'support/controller_helpers'

RSpec.describe ProtectedController, type: :controller do

  it "blocks unauthenticated access to protected#index" do
    sign_in nil

    get :index

    expect(response).to redirect_to(new_user_session_path)
  end

  it "allows authenticated access to protected#index" do
    sign_in

    get :index

    expect(response).to be_success
  end

end
