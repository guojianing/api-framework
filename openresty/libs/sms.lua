local http = require("resty.http")
local string = require("string")

local _M = {}
_M._VERSION = '0.1'

function _M.sendSMSByML(mobile, content) 
	local params = {
		username = 'xdpb',
		password = 'BiaoBai_dx_140630', 
		mobile = mobile, 
		content = content,
		apikey = 'd3f5853b3bf4986b6df17caf216d60d1', 
		encode = 1,
	}
	local param = ''
	for k, v in pairs(params) do
		param = k .. "=" .. v .. "&" .. param 
	end
	
	param = string.sub(param, 0, #param - 1)
	
	local hc = http:new()
	local ok, code, header, status, body = hc:request({
		url = "http://m.5c.com.cn/api/send/",
		method = "POST",
		headers = {["Content-Type"] = "application/x-www-form-urlencoded"},
		body = param
	})
	-- ngx.say(ok)
	-- ngx.say(code)
	-- ngx.say(body)
	if ok == 1 and code == 200 and string.find(body, 'success') then
		return true;
	end
	return false;
end

return _M
