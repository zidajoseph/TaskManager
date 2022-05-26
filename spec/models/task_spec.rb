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
  describe 'search function' do
    let!(:task) { FactoryBot.create(:task)}
    let!(:second_task) { FactoryBot.create(:second_task) }
    context 'If a fuzzy search of a title is performed using the scope method' do
      it "Tasks containing search terms are returned." do
        expect(Task.search_name('1')).to include(task)
        expect(Task.search_name('1')).not_to include(second_task)
        expect(Task.search_name('1').count).to eq 1
      end
    end
    context 'If a status lookup is performed using the scope method' do
      it "Tasks with exactly matching status are returned." do
        expect(Task.search_status('completed')).to include(task)
        expect(Task.search_status('completed')).not_to include(second_task)
        expect(Task.search_status('completed').count).to eq 1
      end
    end
    context 'Searches for ambiguous titles and statuses in the scope method' do
      it "Tasks are narrowed down to those that contain search terms in the title and match the status exactly." do
        expect(Task.search_name('1').search_status('completed')).to include(task)
        expect(Task.search_name('1').search_status('completed')).not_to include(second_task)
        expect(Task.search_name('1').search_status('completed').count).to eq 1
      end
    end
  end
end
