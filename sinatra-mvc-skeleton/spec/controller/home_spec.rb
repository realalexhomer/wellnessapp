require_relative '../spec_helper'
class HomeSpec
  describe 'home' do
    it 'should respond to /' do
      get '/'
      expect(last_response).to be_ok
    end
  end 
end

class UserSpec
  describe 'users' do
    let(:user) { User.create(name: "Alex", user_name: "alex420", password_digest: "password", photo: "http://www.online-image-editor.com//styles/2014/images/example_image.png")}

      before do
        user
      end

      it 'should show the user name' do
      get 'users/:id'
      expect (last_response.body).to include 'alex420'
    end

      it 'should respond to /signup' do
      post '/signup', params={ user: {name: 'Derrick Wu', user_name: "popeye360", password_digest: "spinach", photo: "http://www.animationmagazine.net/wordpress/wp-content/uploads/Popeye-post-new1.jpg"}}
      expect(last_response).to be_redirect
      follow_redirect!
      expect( last_response.body).to include 'popeye360'
      expect( last_response.body).to include 'Derrick Wu'
      end
  end
end 
