FactoryBot.define do
    factory :task do
        name { 'Test1'}
        content { 'Description1'}
        dead_line { '2025-05-05'}
        status {'completed'}
        priority {'high'}
    end
    factory :second_task, class: Task do
        name { 'Test2'}
        content { 'Description2'}
        dead_line { '2022-05-05'}
        status {'inprogress'}
        priority {'low'}
    end
end
