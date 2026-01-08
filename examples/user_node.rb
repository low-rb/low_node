require_relative '../low_node'

class UserNode < LowNode
  observe 'users/:id'

  def initialize(event)
    @user = UserData.find(event[:id])
  end

  def render
    <p>{{@user.name}}</p>
  end
end
