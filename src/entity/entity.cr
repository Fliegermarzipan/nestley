module NEStley
  class Entity
    def wants_coord?(x, y) : Bool
      false
    end

    def color_at(x, y) : UInt32
      0_u32
    end

    def needs_redraw? : Bool
      false
    end

    def drawn!
    end
  end
end
