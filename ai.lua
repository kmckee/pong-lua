AI = { }

function AI:load()
    self.width = 20
    self.x = love.graphics.getWidth() - 50 - self.width 
    self.y = love.graphics.getHeight() / 2
    self.img = love.graphics.newImage('assets/2.png')
    self.height = self.img:getHeight()
    self.width = self.img:getWidth()
    self.speed = 500
    self.yVelocity = 0
    self.speed = 500
    self.timer = 0
    self.rate = 0.6
end

function AI:update(dt)
    self:move(dt)
    self.timer = self.timer + dt
    if self.timer > self.rate then
        self.timer = 0
        self:acquireTarget()
    end
end

function AI:move(dt)
    self.y = self.y + self.yVelocity * dt
end

function AI:acquireTarget() 
    if Ball.y + Ball.height < self.y then
        self.yVelocity = -self.speed
    elseif Ball.y > self.y + self.height then
        self.yVelocity = self.speed
    else
        self.yVelocity = 0
    end
end

function AI:draw()
    love.graphics.draw(self.img, self.x, self.y)
end