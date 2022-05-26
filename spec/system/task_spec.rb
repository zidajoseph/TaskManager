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
        select '2024', from: 'task[dead_line(1i)]'
        select 'June', from: 'task[dead_line(2i)]'
        select '6', from: 'task[dead_line(3i)]'
        select 'completed', from: 'task[status]'
        select 'high', from: 'task[priority]'

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
       expect(task_test[0]).to have_content 'content4'
      end
    end
 end
 describe 'Sorting function' do
    context 'Clic here to sort by endate' do
      it "A list of tasks sorted in descending order of end date is displayed." do
        task = FactoryBot.create(:task),FactoryBot.create(:second_task)
        visit tasks_path
        click_on "Deadline"
        sleep 1.0
        task_list = all('td')
        expect(task_list[0]).to have_content 'Description1'
      end
    end
    context 'Tap the link to Sort by priority' do
      it "A list of tasks sorted in ascending order of priority is displayed." do
        task = FactoryBot.create(:task),FactoryBot.create(:second_task)
        visit tasks_path
        click_on "Priority"
        sleep 1.0
        task_list = all('td')
        expect(task_list[0]).to have_content 'Description1'
      end
    end
    context 'If a fuzzy search is performed on the title' do
      it "Reduced by tasks containing search terms." do
      sleep 1.0
      visit tasks_path
      fill_in 'name', with: 'Test1'
      click_on 'Search'
      expect(page).to have_content '1'
      end
    end
    context 'When a status search is performed.' do
      it "Tasks with exactly matching status are collapsed." do
        visit tasks_path
        select "completed", from: "number"
        click_on 'Search'
        expect(page).to have_content 'completed'
      end
    end
    context 'When ambiguous title and status searches are performed' do
      it "Tasks are narrowed down to those that contain search terms in the title and match the status exactly." do
  
      visit tasks_path
      fill_in 'name', with: 'Test2'
      select "inprogress", from: "number"
      click_on 'Search'
      expect(page).to have_content '2'
      expect(page).to have_content 'inprogress'
      end
    end  
  end
end