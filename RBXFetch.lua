local RBXFetch = {}
local HttpService = game:GetService("HttpService")
local Promise = require(script.Promise)

function RBXFetch.toTable(str)
	return HttpService:JSONDecode(str)
end

function RBXFetch.GET(url)
	if not url then
		error("[RBXFetch]: No URL specified")
	end
	
	return Promise.new(function(resolve, reject)
		local get = HttpService:GetAsync(url)
		
		if get then
			resolve(get)
		else
			reject("[RBXFetch]: An error occured while fetching")
		end
	end)
end

function RBXFetch.POST(url, data, contentType)
	if not url then
		error("[RBXFetch]: No URL specified")
	end
	
	if not data then
		error("[RBXFetch]: No data to send")
	end
	
	if type(data) ~= "table" then
		error("[RBXFetch]: Data is not a table")
	end
	
	if not contentType then contentType = Enum.HttpContentType.ApplicationJson end

	return Promise.new(function(resolve, reject)
		local d = ""
		for i,v in pairs(d) do
			d = d..("&%s=%s"):format(HttpService:UrlEncode(i), HttpService:UrlEncode(v))
		end
		
		d = d:sub(2)
		
		local get = HttpService:PostAsync(url, d, contentType, false)
		local res = HttpService:JSONDecode(get)

		if res.ok then
			resolve(res.data)
		else
			reject(res.error)
		end
	end)
end

return RBXFetch
