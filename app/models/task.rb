class Task < ApplicationRecord
    validates :name, :content,  presence: true
    enum status: { notstarted:1,inprogress:2,completed:3 }
    enum priority: { high:1,medium:2,low:3 }
    scope :search_name, -> name {where("name LIKE ?", "%#{name}%")}
    scope :search_status, -> status {where(status: status)}
    paginates_per 2
end
