require 'rails_helper'

RSpec.describe LearningResourceFacade do
  it 'creates single object combining videos and images' do
    response = LearningResourceFacade.learning_resource('laos')
    expect(response).to be_a(LearningResource)
  end
end
