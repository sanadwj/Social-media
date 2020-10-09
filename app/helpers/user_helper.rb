module UserHelper

  def add_friend(user)
    if current_user.id == user.id
      nil
    elsif pending_id(current_user).find {|x| x == user.id}
      link_to 'Cancel Invite', reject_path(user_id: current_user.id, friend_id: user.id), class: 'btn btn-danger col', method: :delete
    else
      link_to 'Add Friend', user_friendships_path(user), class: 'btn btn-success col', method: :post, value: '1'
    end
  end

  def pending_id(user)
    @ids = []
    user.pending_friends.each do |person|
      @ids << person.id
    end
    @ids << current_user.id
  end
end
