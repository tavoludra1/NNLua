-- Define the sigmoid activation function
local function sigmoid(x)
    return 1 / (1 + math.exp(-x))
end

-- Initialize the network with random weights and biases
local network = {
    inputs = 2,  -- Number of input neurons
    hidden = 2,  -- Number of hidden neurons
    outputs = 1,  -- Number of output neurons
    weights1 = {}, -- Weights between input and hidden layers
    biases1 = {},  -- Biases for the hidden layer
    weights2 = {}, -- Weights between hidden and output layers
    biases2 = {},  -- Biases for the output layer
}

-- Initialize weights and biases with random values between -1 and 1
for i = 1, network.inputs do
    network.biases1[i] = (math.random() * 2) - 1
    for j = 1, network.hidden do
        network.weights1[i] = network.weights1[i] or {}
        network.weights1[i][j] = (math.random() * 2) - 1
    end
end

for i = 1, network.hidden do
    network.biases2[i] = (math.random() * 2) - 1
    for j = 1, network.outputs do
        network.weights2[i] = network.weights2[i] or {}
        network.weights2[i][j] = (math.random() * 2) - 1
    end
end

-- Define the feedforward function
local function feedforward(inputs)
    local hidden = {}
    for i = 1, network.hidden do
        local sum = network.biases1[i]
        for j = 1, network.inputs do
            sum = sum + inputs[j] * network.weights1[j][i]
        end
        hidden[i] = sigmoid(sum)
    end

    local outputs = {}
    for i = 1, network.outputs do
        local sum = network.biases2[i]
        for j = 1, network.hidden do
            sum = sum + hidden[j] * network.weights2[j][i]
        end
        outputs[i] = sigmoid(sum)
    end

    return outputs
end

-- Example usage:
local inputs = { 0.5, 0.8 }  -- inputs value 
local outputs = feedforward(inputs)

-- Print the output
for i = 1, network.outputs do
    print("Output " .. i .. ": " .. outputs[i])
end




