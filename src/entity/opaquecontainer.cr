require "./container"

module NEStley
  class OpaqueContainer < Container
    def initialize(@width, @height, @x = 0, @y = 0, @background_color = 0xaaaa00)
      super(@width, @height, @x, @y, @background_color)
      @entities = Array(Entity).new
      @entities << Rect.new(@width, @height, 0, 0, @background_color)
    end
  end
end
