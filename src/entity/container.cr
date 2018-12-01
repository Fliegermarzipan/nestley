require "./rect"

module NEStley
  class Container < Rect
    property entities : Array(Entity)

    def initialize(@width, @height, @x = 0, @y = 0, @background_color = 0xaaaa00)
      super(@width, @height, @x, @y, @background_color)
      @entities = Array(Entity).new
    end

    def <<(entity : Entity)
      @entities << entity
    end

    def wants_coord?(x, y) : Bool
      ret = false
      @entities.each do |entity|
        ret ||= entity.wants_coord?(x - @x, y - @y)
      end
      ret && super(x, y)
    end

    def color_at(x, y) : UInt32
      ret = 0_u32
      @entities.each do |entity|
        if entity.wants_coord?(x - @x, y - @y)
          ret = entity.color_at(x - @x, y - @y)
        end
      end
      ret
    end

    def needs_redraw? : Bool
      ret = false
      @entities.each do |entity|
        ret ||= entity.needs_redraw?
      end
      ret
    end

    def drawn!
      @entities.each do |entity|
        entity.drawn!
      end
    end
  end
end
