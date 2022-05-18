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
end