require "./entity"

module NEStley
  class Rect < Entity
    property width : UInt32
    property height : UInt32
    property x : Int32
    property y : Int32
    property background_color : Int32
    property needs_redraw : Bool

    def initialize(@width, @height, @x = 0, @y = 0, @background_color = 0xaaaa00)
      @needs_redraw = true
    end

    def set_background(color)
      @background_color = color
      @needs_redraw = true
    end

    def wants_coord?(x, y) : Bool
      x > @x && x < @x + @width && y > @y && y < @y + @height
    end

    def color_at(x, y) : UInt32
      @background_color.to_u32
    end

    def needs_redraw? : Bool
      @needs_redraw
    end

    def drawn!
      @needs_redraw = false
    end
  end
end
