require "./container"

module NEStley
  class Border < Container
    def initialize(@width, @height, @x = 0, @y = 0, @background_color = 0xaaaa00, @rounded = true)
      super(@width, @height, @x, @y, @background_color)
      @entities = Array(Entity).new
      thick = 8_u32
      if (rounded)
        @entities << Rect.new(@width - thick*4, thick, 2*thick, 0, @background_color)
        @entities << Rect.new(@width - thick*4, thick, 2*thick, @height.to_i32 - thick, @background_color)

        @entities << Rect.new(thick, height - thick*4, 0, 2*thick, @background_color)
        @entities << Rect.new(thick, height - thick*4, @width.to_i32 - thick, 2*thick, @background_color)

        @entities << Rect.new(thick, thick, thick.to_i32, thick.to_i32, @background_color)
        @entities << Rect.new(thick, thick, @width.to_i32 - thick.to_i32*2, thick.to_i32, @background_color)
        @entities << Rect.new(thick, thick, thick.to_i32, @height.to_i32 - thick.to_i32*2, @background_color)
        @entities << Rect.new(thick, thick, @width.to_i32 - thick.to_i32*2, @height.to_i32 - thick.to_i32*2, @background_color)
      else
        @entities << Rect.new(@width - thick*2, thick, thick.to_i32, 0, @background_color)
        @entities << Rect.new(@width - thick*2, thick, thick.to_i32, @height.to_i32 - thick, @background_color)

        @entities << Rect.new(thick, height - thick*2, 0, thick.to_i32, @background_color)
        @entities << Rect.new(thick, height - thick*2, @width.to_i32 - thick, thick.to_i32, @background_color)
      end
    end
  end
end
