require 'rails_helper'
RSpec.describe 'Labels management function', type: :system do
  let!(:label) { FactoryBot.create(:label) }
  let!(:user) { FactoryBot.create(:ordinary_user) }
  let!(:task) { FactoryBot.create(:task, user: user)}
  before do
    visit new_session_path
    fill_in "session[email]",with: "not_admin@example.com"
    fill_in "session[password]",with: "123456"
    click_on "Log in"
  end

  describe 'New creation function' do
    context 'When label is created.' do
      it 'It wil be displayed successfuly.' do
        visit new_label_path
        fill_in "label[name]",with: "abc"
        click_on "Create Label"
        expect(page).to have_content 'Label was successfully created.'
      end
    end
  end

  describe 'Listing function' do
    context 'when you visite labels liste, labels is displayed' do
      it 'Created labels can be diplayed.' do
        visit labels_path
        expect(page).to have_content 'Blue'
      end
    end
  end

  describe 'New task creation function' do
    context 'when creating a new task' do
      it 'It is possible to attache multiples labels.' do
        visit new_task_path
        fill_in 'task[name]',with: 'test1'
        fill_in 'task[content]',with: 'test2'
        select '2024', from: 'task[dead_line(1i)]'
        select 'June', from: 'task[dead_line(2i)]'
        select '6', from: 'task[dead_line(3i)]'
        select 'completed', from: 'task[status]'
        select 'high', from: 'task[priority]'
        check 'Blue'
        click_on "Create Task"
        expect(page).to have_content 'Blue'
      end
    end

    context 'When you visite the task details page.' do
      it 'Labels are also displaye.' do
        visit tasks_path
        click_on "Show"
        expect(page).to have_content 'Blue'
      end
    end
  end

  describe 'Search function' do
    context 'Clic on search button.' do
        it 'The task with that label is displaye.' do
          visit new_task_path  
          fill_in 'task[name]',with: 'test1'
          fill_in 'task[content]',with: 'test2'
          select '2024', from: 'task[dead_line(1i)]'
          select 'June', from: 'task[dead_line(2i)]'
          select '6', from: 'task[dead_line(3i)]'
          select 'completed', from: 'task[status]'
          select 'high', from: 'task[priority]'
          check 'Blue'
          click_on "Create Task"
          expect(page).to have_content 'Blue'
          visit tasks_path
          select 'Blue'
          click_on 'Search'
          expect(page).to have_content ''
        end
      end
  end
end