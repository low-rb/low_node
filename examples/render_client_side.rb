require_relative '../low_node'

class UserNode < LowNode
  observe 'api/v1/users/:id'

  def initialize(event:)
    @user = UserData.find(event[:id])
  end

  def render
    {
      name: @user.name,
      rsvp: @user.rsvp,
      diet: @user.diet,
    }
  end
end
