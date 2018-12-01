require "./opaquecontainer"

module NEStley
  class BorderedOpaqueContainre < OpaqueContainer
    def initialize(@width, @height, @x = 0, @y = 0, @background_color = 0xaaaa00)
      super(@width, @height, @x, @y, @background_color)
      @entities << Border.new(@width, @height, 0, 0, NEStley::Color::LIGHT.value)
    end
  end
end
