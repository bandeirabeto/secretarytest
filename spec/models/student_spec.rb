require 'spec_helper'
require 'rails_helper'

RSpec.describe Student, type: :model do

  subject {
    Student.create(name: "xxxxxxxxxxxxxxxxxxxxxxx", register_number: '312.141.412-41', status: 1)
  }

  describe "Associations" do
    it { should have_many(:classrooms) }
    it { should have_many(:courses) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:register_number) }
  end

  describe 'instantiation' do
    it 'instantiates a list' do
      expect(subject.class.name).to eq("Student")
    end
  end

end
