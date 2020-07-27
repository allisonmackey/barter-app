require 'rails_helper'

describe Post do 
  it {should have_many(:comments)}
end