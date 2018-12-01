require "./rect"

module NEStley
  class Border < Rect
    property thickness : UInt32
    property offset : UInt32

    def initialize(@width, @height, @x = 0, @y = 0, @background_color = 0xaaaa00)
      super(@width, @height, @x, @y, @background_color)
      @thickness = 10_u32
      @offset = 2_u32
    end

    def set_thickness(target : UInt32)
      @thickness = target
    end

    def set_offset(target : UInt32)
      @offset = target
    end

    def wants_coord?(x, y) : Bool
      # x > @x && x < @x + @width && y > @y && y < @y + @height
      left = x > @x + @offset
      left &= x < @x + @thickness

      right = x < @x + @width - @offset
      right &= x > @x + @width - @thickness

      top = y > @y + @offset
      top &= y < @y + @thickness

      bottom = y < @y + @height - @offset
      bottom &= y > @y + @height - @thickness

      corner = x < @thickness && y < @thickness                     # top left
      corner |= x < @thickness && y > @height - @thickness          # top left
      corner |= x > @width - @thickness && y < @thickness           # top right
      corner |= x > @width - @thickness && y > @height - @thickness # bottom right

      (right || left || top || bottom) && !corner
    end
  end
end
