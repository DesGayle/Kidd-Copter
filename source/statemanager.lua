
StateManager = {
    states = {},
    currentState = nil
}

function StateManager:addState(name, state)
    self.states[name] = state
end

function StateManager:setState(name)
    if self.currentState and self.currentState.exit then
        self.currentState.exit()
    end
    self.currentState = self.states[name]
    if self.currentState and self.currentState.enter then
        self.currentState.enter()
    end
end

function StateManager:update()
    if self.currentState and self.currentState.update then
        self.currentState.update()
    end
end

function StateManager:draw()
    if self.currentState and self.currentState.draw then
        self.currentState.draw()
    end
end

--return StateManager
