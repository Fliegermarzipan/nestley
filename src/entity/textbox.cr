require "./rect"
require "fontanyl"

module NEStley
  class Textbox < Rect
    property msg : String
    property wrap : UInt32
    property rendered_msg : Array(Array(Bool))
    property font : Fontanyl::Font

    def initialize(@width, @height, @x = 0, @y = 0, @background_color = 0xaaaa00)
      super
      @msg = ""
      @wrap = 0_u32
      @font = Fontanyl::Font.new
      @rendered_msg = Array(Array(Bool)).new
    end

    def set_font(@font : Fontanyl::Font = Fontanyl::Font.new) : Textbox
      set_msg if @msg.size > 0
      self
    end

    def set_msg(@msg : String = @msg) : Textbox
      @rendered_msg = @font.get_bitmap(@msg, @wrap).reduce { |a, b| a + b }
      @needs_redraw = true
      self
    end

    def set_wrap(@wrap : UInt32 = @wrap) : Textbox
      set_msg if @msg.size > 0
      self
    end

    def wants_coord?(x, y) : Bool
      ret = false
      begin
        ret = rendered_msg[y - @y][x - @x]
      rescue e : Exception
        ret = false
      end
      ret
    end
  end
end
