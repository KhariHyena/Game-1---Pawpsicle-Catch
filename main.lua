function love.load()
  lives = 3
  score = 0
  nick = love.graphics.newImage("nick.png")
  nick_x = 300
  nick_y = 550
  nick_pixels_per_second = 350
  pawpsicle = love.graphics.newImage("pawpsicle.png")
  pawpsicle_x = love.math.random(100, 650)
  pawpsicle_y = 0
  pawpsicle_y_limit = 630
  pawpsicle_gravity = love.math.random(125, 300)
  highscore = 0
  game_playing = true
end

function love.update(dt)

  pawpsicle_y = pawpsicle_y + pawpsicle_gravity * dt
    if pawpsicle_y >= pawpsicle_y_limit then
      lives = lives - 1
      pawpsicle_gravity = love.math.random(125, 300)
      pawpsicle_x = love.math.random(100, 650)
      pawpsicle_y = 0
  end
    if pawpsicle_x >= nick_x - 5 and pawpsicle_x <= nick_x + 35 and pawpsicle_y >= nick_y - 5 and pawpsicle_y <= nick_y + 50 then
      score = score + 10
      pawpsicle_gravity = love.math.random(125, 300)
      pawpsicle_x = love.math.random(100, 650)
      pawpsicle_y = 0
  end
    if lives == 0 then
      game_playing = false
    end
    if score > highscore then
      highscore = score
    end
  if love.keyboard.isDown("space") then
    game_playing = true
  end
  if love.keyboard.isDown("left") and nick_x >= 100 then
    nick_x = nick_x - nick_pixels_per_second * dt
  end
  if love.keyboard.isDown("right") and nick_x <= 650 then
    nick_x = nick_x + nick_pixels_per_second * dt
  end

end

function love.draw()
  love.graphics.print("Highscore: ", 650, 40)
  love.graphics.print(highscore, 750, 40)
if game_playing then
  love.graphics.print("Score: ", 600, 10)
  love.graphics.print(score, 650, 10)
  love.graphics.print("Lives: ", 700, 10)
  love.graphics.print(lives, 750, 10)
  love.graphics.draw(nick, nick_x, nick_y)
  love.graphics.draw(pawpsicle, pawpsicle_x, pawpsicle_y)
end
if game_playing == false then
  love.graphics.print("GAME OVER press Spacebar to Play Again", 275, 250)
  lives = 3
  pawpsicle_y = 0
  pawpsicle_x = love.math.random(100, 650)
  score = 0
end
end
