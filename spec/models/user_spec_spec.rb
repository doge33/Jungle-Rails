require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Validations" do
    
    it "should create user given name, email, password and matching password_confirmation" do
      @user = User.new(name: "Liz", email: "liz@liz.com", password: "123456", password_confirmation: "123456")

      expect(@user.save).to be_truthy
    end

    it "should fail create user given non-matching password_confirmation" do
      @user = User.new(name: "Liz", email: "liz@liz.com", password: "123456", password_confirmation: "abcdef")

      expect(@user.save).to be_falsy
    end

    it "should fail to create user if email already exists" do
      user1 = User.create(name: "Liz", email: "liz@liz.com", password: "123456", password_confirmation: "123456")
      user2 = User.new(name: "Lizzy", email: "liz@liz.com", password: "abcdef", password_confirmation: "abcdef")
      
      expect(user2.save).to be_falsey
    end

    it "should not be case sensitive" do
      user1 = User.create(name: "Liz", email: "liz@liz.com", password: "123456", password_confirmation: "123456")
      user2 = User.new(name: "Lizzy", email: "LIZ@liz.com", password: "abcdef", password_confirmation: "abcdef")
      
      expect(user2.save).to be_falsey  
    end

    it "should fail to create user if password length is less then 6" do
      user = User.new(name: "Liz", email: "liz@liz.com", password: "123", password_confirmation: "123")
      expect(user.save).to be_falsey
    end
  end

  describe ".authenticate_with_credentials" do

    before do
      Liz = User.create(name: "Liz", email: "liz@liz.com", password: "123456", password_confirmation: "123456")
    end

    it "should successfully log in with correct credentials" do
      user = User.authenticate_with_credentials("liz@liz.com", "123456")
      expect(user).to eq(Liz)
    end

    it "should fail to log in if user does not exist" do
      user = User.authenticate_with_credentials("NOT@exist.com", "whatever")
      expect(user).to be_nil
    end

    it "should fail to log in if password entered is incorrect" do
      user = User.authenticate_with_credentials("liz@liz.com", "654321")
      expect(user).to be_nil

    end

  end

end
