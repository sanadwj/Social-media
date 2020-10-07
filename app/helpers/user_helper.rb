module UserHelper

  def add_friend(user)
    if current_user.id == user.id
       nil
    elsif user.id == pending_id(current_user)
      link_to 'Cancel Invite', reject_path(user_id: current_user.id, friend_id: user.id), class: 'btn btn-danger col', method: :delete
    else
      link_to 'Add Friend', user_friendships_path(user), class: 'btn btn-success col', method: :post
    end
  end

  def pending_id(user)
    id = 0
    user.pending_friends.each do |i|
      id = i.id
    end
    id

  end

end
