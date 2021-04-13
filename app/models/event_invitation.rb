class EventInvitation < ApplicationRecord
  belongs_to :group_member
  belongs_to :event
end
