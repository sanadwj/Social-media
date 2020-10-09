module FriendshipsHelper

  def mutual
    if show_mutual == nil
      puts "No Mutual Friend found"
    else
      @mutual_friends = User.where(id: show_mutual)
    end
  end

  def show_mutual
    @ids = []
    current_user.friends.each do |person|
      person.friends.each do |m|
        @ids << m.id
      end
    end
    @ids.reject { |x| x == current_user.id }

  end

end
