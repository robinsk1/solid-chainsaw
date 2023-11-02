require 'rspec/autorun'
require './validate_password'

RSpec.describe ValidatePassword do 
  let(:valid_password) { 'Pas_w0rd' }
  context 'passing' do 
    describe '.valid?' do 
      it 'when password is valid' do 
        expect(ValidatePassword.new(valid_password).valid?).to be_truthy
      end
    end
  end

  context 'failing' do 
    describe '.valid?' do 
      it 'when password is less than 8' do 
        expect(ValidatePassword.new(valid_password[0..6]).valid?).to be_falsy
      end
      it 'when password has no capital letter' do 
        expect(ValidatePassword.new(valid_password.downcase).valid?).to be_falsy
      end
      it 'when password has no lower case letter' do 
        expect(ValidatePassword.new(valid_password.upcase).valid?).to be_falsy
      end
      it 'when password has no underscore' do 
        expect(ValidatePassword.new(valid_password.gsub('_', '-')).valid?).to be_falsy
      end
      it 'when password has no number' do 
        expect(ValidatePassword.new(valid_password.gsub(/\d+/, 'X')).valid?).to be_falsy
      end
    end
  end
end
