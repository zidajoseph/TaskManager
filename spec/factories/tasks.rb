FactoryBot.define do
    factory :task do
        name { 'Name Test 1' }
        content { 'Description Test 1' }
        end
        factory :second_task, class: Task do
        name { 'Name Test 2' }
        content { 'Description Test 2' }
    end
end
