class GroupMessage < ApplicationRecord
  belongs_to :user
  belongs_to :group,  inverse_of: :group_messages


def as_json(options)
  super(options).merge(user_avatar_url: user.gravatar_url)
end

end
