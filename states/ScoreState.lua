--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]--w=love.graphics.newImage('bird.png')

function ScoreState:init()
    --self.image = love.graphics.newImage('goldMedal.png')
    --self.width = self.image:getWidth()
    --self.height = self.image:getHeight()

    self.x =( VIRTUAL_WIDTH / 2 - (48 / 2) )+ 150
    self.y = VIRTUAL_HEIGHT / 2 - (70 / 2)
end

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
    
    if self.score > 10 then
        self.image = love.graphics.newImage('goldMedal.png')
        love.graphics.draw(self.image, self.x, self.y)
    elseif self.score > 5 then
        self.image = love.graphics.newImage('silverMedal.png')
        love.graphics.draw(self.image, self.x, self.y)
    elseif self.score > 2 then
        self.image = love.graphics.newImage('bronzeMedal.png')
        love.graphics.draw(self.image, self.x, self.y)
    end

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end