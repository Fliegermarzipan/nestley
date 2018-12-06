#!/usr/bin/env crystal

require "benchmark"
require "crixel"

require "./src/NEStley"

width = 1280_u32
height = 720_u32

img = Crixel::SixelImage.new(width, height)

entities = [] of NEStley::Entity
entities << NEStley::Rect.new(200_u32, 100_u32, 50, 50, NEStley::Color::PRIMARY.value)

cont = NEStley::BorderedOpaqueContainer.new(400_u32, 300_u32, (width/2 - 200).to_i32, (height/2 - 150).to_i32, NEStley::Color::LIGHT.value, NEStley::Color::DARK.value)
entities << cont

cont << NEStley::Button.new(130_u32, 60_u32, 30, 200, NEStley::Color::SUCCESS.value)
cont << NEStley::Button.new(130_u32, 60_u32, 240, 200, NEStley::Color::ERROR.value)

height.times do |y|
  width.times do |x|
    drawn = false
    entities.each do |entity|
      if entity.needs_redraw?
        if entity.wants_coord?(x, y)
          img.set(x, y, entity.color_at(x, y))
          drawn = true
        end
      end
    end
    img.set(x, y, 0xffffff_u32) unless drawn
  end
end
entities.each do |entity|
  entity.drawn!
end

delta = Benchmark.realtime do
  img.render_naive_full
end
puts delta
