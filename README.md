<div align="center">
  <h1>RBXFetch</h1>
  <p>A lightweight wrapper of Roblox's <code>HttpService</code></p>
  Built with (roblox-lua-promise)[https://github.com/evaera/roblox-lua-promise]
</div>

## Installation
The installation is quite easy.

Download the <code>RBXFetch.rbxm</code> in the <strong>Releases</strong> tab - pick whatever version you prefer (currently there is only one)
Then, just drag that file over to Roblox into <code>ServerScriptService</code>

## Examples
Simple GET request

<strong>Make sure Fetch is defined as the RBXFetch module</strong>
```lua
Fetch.GET("https://api.example.com/")
	:andThen(function(res)
		local resTable = Fetch.toTable(res)
		for i,v in pairs(resTable) do
			print(i, v)
		end
	end)
	:catch(function(err)
		warn(err)	
	end)
```

Simple POST request
```lua
Fetch.POST("https://api.example.com/", { ["some-property"] = "some-value" }, Enum.HttpContentType.ApplicationJson)
	:andThen(function(res)
		local resTable = Fetch.toTable(res)
		for i,v in pairs(resTable) do
			print(i, v)
		end
	end)
	:catch(function(err)
		warn(err)	
	end)
```
