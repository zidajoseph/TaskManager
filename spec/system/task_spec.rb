require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end  
  describe 'New creation function' do
    context 'When creating a new task' do
      it 'The created task is displayed' do
        visit new_task_path
        fill_in 'Name', with: 'name_test'
        fill_in 'Content', with: 'content_test'
        click_on 'Create Task'
        expect(page).to have_content 'task'
      end
    end
  end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'A list of created tasks is displayed' do
        task = FactoryBot.create(:task, name: 'task', content: 'content')
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
  end
  describe 'Detailed display function' do
     context 'When transitioning to any task details screen' do
       it 'The content of the corresponding task is displayed' do
        task = FactoryBot.create(:task, name: 'task', content: 'content')
        visit task_path(task.id)
        expect(page).to have_content 'content'
       end
     end
  end
  describe 'Testing task sorting by creation date and time' do
    context 'Testing if lastest task is first displayed' do
      it 'Sorting by creation date' do
       task = FactoryBot.create(:task, name: 'task1', content: 'content1')
       task = FactoryBot.create(:task, name: 'task2', content: 'content2')
       task = FactoryBot.create(:task, name: 'task3', content: 'content3')
       task = FactoryBot.create(:task, name: 'task4', content: 'content4')
       visit tasks_path
       task_test = all('td')
       expect(task_test[0]).to have_content 'task4'
      end
    end
 end
end