class Task < ApplicationRecord
    validates :name, :content,  presence: true
    enum status: { notstarted:1,inprogress:2,completed:3 }
    enum priority: { high:1,medium:2,low:3 }
end
