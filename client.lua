local screenW, screenH = guiGetScreenSize()
local px, py = screenW / 1366, screenH / 768

local font = dxCreateFont("Regular.ttf", 14 * px)

local playerMoney = 0
local playerName = ""

function formatMoney(amount)
    local formatted = tostring(amount)
    local reverse = formatted:reverse()
    local result = reverse:gsub("(%d%d%d)", "%1,")
    return result:reverse()
end

function updatePlayerInfo()
    playerMoney = formatMoney(getPlayerMoney(localPlayer))
    playerName = getPlayerName(localPlayer)
end

function drawHUD()
    updatePlayerInfo()

    -- Draw avatar
    dxDrawImage(1240 * px, 10 * px, 125 * px, 125 * px, "i/avatar.png")

    -- Draw health bar
    dxDrawImage(1065 * px, 50 * px, 175 * px, 20 * px, "i/health.png", 0, 0, 0, tocolor(255, 255, 255, 200))

    -- Draw money text shadow
    dxDrawText(playerMoney .. ",00$", 1065.5 * px, 81 * px, 75 * px, 75 * px, tocolor(0, 0, 0, 200), 0.81, font, "left", "top", false, false, false, false, false)

    -- Draw player name shadow
    dxDrawText(playerName, 1200 * px, 13 * px, 75 * px, 75 * px, tocolor(0, 0, 0, 200), 1.02, font, "left", "center", false, false, false, false, false)

    -- Draw money text
    dxDrawText(playerMoney .. ",00$", 1065 * px, 80 * px, 75 * px, 75 * px, tocolor(80, 144, 43, 255), 0.8, font, "left", "top", false, false, false, false, false)

    -- Draw player name
    dxDrawText(playerName, 1200 * px, 11 * px, 75 * px, 75 * px, tocolor(255, 255, 255, 255), 1, font, "left", "center", false, false, false, false, false)
end
addEventHandler("onClientRender", root, drawHUD)

addEventHandler("onClientPlayerSpawn", root, disableHUD)

function toggleHUD(player, showHUD)
    setPlayerHudComponentVisible(player, "all", showHUD)
end
