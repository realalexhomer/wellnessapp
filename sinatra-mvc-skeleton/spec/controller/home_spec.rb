require_relative '../spec_helper'
class HomeSpec
  describe 'home' do
    it 'should respond to /' do
      get '/'
      expect(last_response).to be_ok
    end
  end
end