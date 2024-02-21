local axios = require('libraries.axios')
local config = require('libraries.config')
local data = require('config')

local api, cfg = axios:new(data.updater_url), config:new('version.cfg')
cfg:setDefault('version', '0.0.0')

local function try_update()
    local result_check = api:Post('check_update', { version = cfg:get('version'), token_check = data.token_check })
    if result_check and result_check.code == 200 and result_check.response.url_update then
        cfg:set('version', result_check.response.lastVersion):save()
        shell.run('wget run ' .. result_check.response.url_update)
    end
end

while true do
    local ws, err = http.websocket("wss://cc.kiefe.ru/updater/wss", { Authorization = data.token_check })
    if ws then
        try_update()
        while pcall(ws.receive) == 'New version!' do try_update() end
        ws.close()
    end
end
