require "./rect"

module NEStley
  class Container < Rect
    property entities : Array(Entity)

    def initialize(@width, @height, @x = 0, @y = 0, @background_color = 0xaaaa00)
      super
      @entities = Array(Entity).new
    end

    def <<(entity : Entity)
      @entities << entity
    end

    def wants_coord?(x, y) : Bool
      ret = false
      @entities.each do |entity|
        ret ||= entity.wants_coord?(x - @x, y - @y)
        break if ret
      end
      ret && super
    end

    def color_at(x, y) : UInt32
      ret = 0_u32
      @entities.reverse_each do |entity|
        if entity.wants_coord?(x - @x, y - @y)
          ret = entity.color_at(x - @x, y - @y)
          break
        end
      end
      ret
    end

    def needs_redraw? : Bool
      ret = false
      @entities.reverse_each do |entity|
        ret ||= entity.needs_redraw?
        break if ret
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
