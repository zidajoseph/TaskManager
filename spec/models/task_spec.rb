require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Validation test' do
    context 'If the task name is empty' do
      it 'Get caught in validation' do
        task = Task.new(name: '', content: 'Failure test')
        expect(task).not_to be_valid
      end
    end
    context 'If the task details are empty' do
      it 'Get caught in validation' do
        task = Task.new(name: 'Failure test', content: '')
        expect(task).not_to be_valid
      end
    end
    context 'If the task name and details are described' do
      it 'Validation passes' do
        task = Task.new(name: 'Pass test', content: 'Pass test')
        expect(task).to be_valid
      end
    end
  end
end
