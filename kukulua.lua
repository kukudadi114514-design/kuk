if game.PlaceId == 8657806289 then
    ------------------------------------------------------
    -- Rayfield UI Initialization & Window Configuration --
    ------------------------------------------------------
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    local Window = Rayfield:CreateWindow({
        Name = "Death Hub 😼 *V2*",
		LoadingTitle = "Injecting Death Hub into the game 💀",
   		LoadingSubtitle = "by DeathShot",
        Theme = "Ocean",
		ConfigurationSaving = {
			Enabled = true,
			FolderName = "Death", -- Create a custom folder for your hub/game
			FileName = "conpik"
		},
    })
    -- Define RunService for heartbeat events
    local RunService = game:GetService("RunService")

    -----------------------------
    -- Main Tab: Enemy & Detonator Settings --
    -----------------------------
    local MainTab = Window:CreateTab("🏠Main🏠")
    MainTab:CreateSection("HitBox Settings")

    MainTab:CreateSlider({
        Name = "Enemy Head Size",
        Range = {1, 30},
        Increment = 0.5,
        CurrentValue = _G.EnemiesHeadSize or 8.0,
        Callback = function(Value)
            _G.EnemiesHeadSize = Value
        end,
    })

    MainTab:CreateSlider({
        Name = "Prometheus Head Size",
        Range = {1, 10},
        Increment = 0.5,
        CurrentValue = _G.PrometheusHeadSize or 6.0,
        Callback = function(Value)
            _G.PrometheusHeadSize = Value
        end,
    })

    MainTab:CreateSlider({
        Name = "Sniper Head Size",
        Range = {1, 10},
        Increment = 0.5,
        CurrentValue = _G.SniperHeadSize or 6.0,
        Callback = function(Value)
            _G.SniperHeadSize = Value
        end,
    })

    MainTab:CreateSlider({
        Name = "Transparency",
        Range = {0, 1},
        Increment = 0.1,
        CurrentValue = _G.Transparency or 0.9,
        Callback = function(Value)
            _G.Transparency = Value
        end,
    })

		MainTab:CreateToggle({
		Name = "Enable Big Heads",
		CurrentValue = false,
		Callback = function(Value)
			_G.ScriptEnabled = Value
			if Value then
				loadBigHeads()
				Rayfield:Notify({
					Title = "Big Heads",
					Content = "Big Heads Enabled!",
					Duration = 3,
				})
			else
				disableBigHeads()
				Rayfield:Notify({
					Title = "Big Heads",
					Content = "Big Heads Disabled!",
					Duration = 3,
				})
			end
		end,
	})

    -----------------------------
    -- Detonator (Coin) Modification Options --
    -----------------------------
    MainTab:CreateSection("Detonator (Coin) Settings")

    MainTab:CreateSlider({
        Name = "Detonator Size",
        Range = {1, 100},
        Increment = 1,
        CurrentValue = _G.CoinSize or 20,
        Callback = function(Value)
            _G.CoinSize = Value
        end,
    })

    MainTab:CreateSlider({
        Name = "Detonator Transparency",
        Range = {0, 1},
        Increment = 0.1,
        CurrentValue = _G.CoinTransparency or 1,
        Callback = function(Value)
            _G.CoinTransparency = Value
        end,
    })

    _G.DetonatorScriptEnabled = false
    local detonatorRunning = false
    local function runDetonatorLoop()
        while _G.DetonatorScriptEnabled do
            task.wait(0.1)
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name == "Coin" then
                    local coinSize = _G.CoinSize or 20
                    local coinTransparency = _G.CoinTransparency or 1
                    obj.Size = Vector3.new(coinSize, coinSize, coinSize)
                    obj.Transparency = coinTransparency
                    obj.CanCollide = false
                end
            end
        end
        detonatorRunning = false
    end


	  MainTab:CreateToggle({
        Name = "Detonator Toggle",
        CurrentValue = _G.DetonatorScriptEnabled,
        Callback = function(Value)
            _G.DetonatorScriptEnabled = Value
            if Value and not detonatorRunning then
                detonatorRunning = true
                task.spawn(runDetonatorLoop)
            end
        end,
    })

    -----------------------------
    -- Experimental --
    -----------------------------
    MainTab:CreateSection("Experimental")
    
    -- ORB SETTINGS
    local orbEnabled = false
    local orbHitboxSize = 6
    local orbTransparency = 0.5

    MainTab:CreateToggle({ -- Fixed incorrect 'Tab'
        Name = "Enable Orb Detection",
        CurrentValue = false,
        Callback = function(Value)
            orbEnabled = Value
            Rayfield:Notify({
                Title = "Orb Detection",
                Content = orbEnabled and "Orb hitbox enabled!" or "Orb hitbox disabled!",
                Duration = 3,
            })
        end,
    })

    MainTab:CreateSlider({ -- Fixed incorrect 'Tab'
        Name = "Orb Hitbox Size",
        Range = {1, 6},
        Increment = 1,
        CurrentValue = 10,
        Callback = function(Value)
            orbHitboxSize = Value
        end,
    })

    MainTab:CreateSlider({ -- Fixed incorrect 'Tab'
        Name = "Orb Transparency",
        Range = {0, 1},
        Increment = 0.1,
        CurrentValue = 0.5,
        Callback = function(Value)
            orbTransparency = Value
        end,
    })

    -- TANK(tank) SETTINGS
    local tanktankEnabled = false
    local tanktankHitboxSize = 5
    local tanktankTransparency = 0.5

    MainTab:CreateToggle({
        Name = "Enable Tank(tank) Hitbox",
        CurrentValue = false,
        Callback = function(Value)
            tanktankEnabled = Value
            Rayfield:Notify({
                Title = "Tank(tank) Hitbox",
                Content = tankEnabled and "Tank hitbox enabled!" or "Tank hitbox disabled!",
                Duration = 3,
            })
        end,
    })

    MainTab:CreateSlider({
        Name = "Tank(tank) Hitbox Size",
        Range = {1, 10},
        Increment = 1,
        CurrentValue = 5,
        Callback = function(Value)
            tanktankHitboxSize = Value
        end,
    })

    MainTab:CreateSlider({
        Name = "Tank(tank) Transparency",
        Range = {0, 1},
        Increment = 0.1,
        CurrentValue = 0.5,
        Callback = function(Value)
            tanktankTransparency = Value
        end,
    })

	-- TANK SETTINGS
    local tankEnabled = false
    local tankHitboxSize = 5
    local tankTransparency = 0.5

    MainTab:CreateToggle({
        Name = "Enable Prometheus Tank Hitbox",
        CurrentValue = false,
        Callback = function(Value)
            tankEnabled = Value
            Rayfield:Notify({
                Title = "Tank Hitbox",
                Content = tankEnabled and "Tank hitbox enabled!" or "Tank hitbox disabled!",
                Duration = 3,
            })
        end,
    })

    MainTab:CreateSlider({
        Name = "Tank Hitbox Size",
        Range = {1, 10},
        Increment = 1,
        CurrentValue = 5,
        Callback = function(Value)
            tankHitboxSize = Value
        end,
    })

    MainTab:CreateSlider({
        Name = "Tank Transparency",
        Range = {0, 1},
        Increment = 0.1,
        CurrentValue = 0.5,
        Callback = function(Value)
            tankTransparency = Value
        end,
    })

    -- Real-time scanning
    RunService.Heartbeat:Connect(function()
        if orbEnabled then
            local orb = game.Workspace:FindFirstChild("Orb")
            if orb and orb:IsA("Model") then
                local rootPart = orb:FindFirstChild("HumanoidRootPart") or orb:FindFirstChildWhichIsA("BasePart")
                if rootPart then
                    rootPart.Size = Vector3.new(orbHitboxSize, orbHitboxSize, orbHitboxSize)
                    rootPart.Transparency = orbTransparency
                    rootPart.Color = Color3.fromRGB(0, 255, 255)
                    rootPart.CanCollide = false
                    rootPart.Massless = true
                end
            end
        end

        if tankEnabled then
            local prometheus = game.Workspace:FindFirstChild("Prometheus")
            if prometheus and prometheus:IsA("Model") then
                for _, tank in ipairs(prometheus:GetChildren()) do
                    if tank:IsA("Model") and tank.Name == "PropaneTank" then
                        for _, part in ipairs(tank:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Size = Vector3.new(tankHitboxSize, tankHitboxSize, tankHitboxSize)
                                part.Transparency = tankTransparency
                                part.Color = Color3.fromRGB(0, 255, 255) -- Fixed color issue
                            end
                        end
                    end
                end
            end
        end
    
		if tanktankEnabled then
            local Tank = game.Workspace:FindFirstChild("Tank")
            if Tank and Tank:IsA("Model") then
                for _, tank in ipairs(Tank:GetChildren()) do
                    if tank:IsA("Model") and tank.Name == "PropaneTank" then
                        for _, part in ipairs(tank:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Size = Vector3.new(tanktankHitboxSize, tanktankHitboxSize, tanktankHitboxSize)
                                part.Transparency = tanktankTransparency
                            end
                        end
                    end
                end
            end
        end
	end)

	-----------------------------
    -- Other Script Sections (Gun Mod, ESP, etc.)
    -----------------------------
    local GunModTab = Window:CreateTab("Gun Mod 🔫")
    GunModTab:CreateSection("Gun Mod Options")

    local showAutoDetectNotif = true
    GunModTab:CreateToggle({
        Name = "Show Auto-Detect Notifications",
        CurrentValue = showAutoDetectNotif,
        Callback = function(Value)
            showAutoDetectNotif = Value
        end,
    })

    local allowedGuns = {
        "Akimbo", "Voltaic Impact", "Gunslingers", "Burst Rifle", "Stonewall",
        "Steelforge", "DMR", "Gift of Fire", "Armour Peeler", "Medical Bow",
        "Recurve", "Vitabow", "Rifle", "Bolter", "Harpoon Gun", "RPG",
        "Rocket Stormer", "Shockwave Device", "Shotgun", "Hallsweeper",
        "Sprinter's Streak", "SMG", "Loose Trigger", "Twinface", "Mastermind's Rifle",
        "Shovel", "Overcharger", "Rallying Cry", "Machete", "Handaxes", "Torqueblade"
    }

    getgenv().AutoDetectWeapon = true
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local lastWpn = nil

    local function getWpn()
        for _, itm in pairs(char:GetChildren()) do
            if itm:IsA("Tool") and table.find(allowedGuns, itm.Name) then
                return itm.Name
            end
        end
        return nil
    end

    task.spawn(function()
        while getgenv().AutoDetectWeapon do
            char = player.Character or player.CharacterAdded:Wait()
            local newWpn = getWpn()
            if newWpn ~= lastWpn then
                lastWpn = newWpn
                print("Auto-detected weapon: " .. (lastWpn or "nil"))
                if showAutoDetectNotif then
                    Rayfield:Notify({
                        Title = "Weapon Detected",
                        Content = "Current weapon: " .. (lastWpn or "None"),
                        Duration = 2
                    })
                end
            end
            task.wait(1)
        end
    end)

    local firerateValue = 500
    local bulletSpeedValue = 9999
    local spreadValue = 0

    GunModTab:CreateInput({
        Name = "Firerate",
        CurrentValue = tostring(firerateValue),
        PlaceholderText = "Enter Firerate",
        RemoveTextAfterFocusLost = false,
        Flag = "FirerateInput",
        Callback = function(Text)
            local num = tonumber(Text)
            if num then
                firerateValue = num
            end
        end,
    })

    GunModTab:CreateInput({
        Name = "Bullet Speed",
        CurrentValue = tostring(bulletSpeedValue),
        PlaceholderText = "Enter Bullet Speed",
        RemoveTextAfterFocusLost = false,
        Flag = "BulletSpeedInput",
        Callback = function(Text)
            local num = tonumber(Text)
            if num then
                bulletSpeedValue = num
            end
        end,
    })

    GunModTab:CreateInput({
        Name = "Spread",
        CurrentValue = tostring(spreadValue),
        PlaceholderText = "Enter Spread",
        RemoveTextAfterFocusLost = false,
        Flag = "SpreadInput",
        Callback = function(Text)
            local num = tonumber(Text)
            if num then
                spreadValue = num
            end
        end,
    })

    GunModTab:CreateButton({
        Name = "Modify Gun",
        Callback = function()
            local player = game.Players.LocalPlayer
            local char = player.Character or player.CharacterAdded:Wait()
            if lastWpn and char:FindFirstChild(lastWpn) then
                local gun = char[lastWpn]
                gun:GetAttributeChangedSignal("Ammo"):Connect(function()
                    print("Ammo for " .. lastWpn .. " has changed!")
                    gun:SetAttribute("Ammo", 999)
                end)
                gun:SetAttribute("Firerate", firerateValue)
                gun:SetAttribute("BulletSpeed", bulletSpeedValue)
                gun:SetAttribute("Spread", spreadValue)
                Rayfield:Notify({
                    Title = "Gun Modified",
                    Content = "Modified " .. lastWpn .. " successfully!",
                    Duration = 3,
                })
            else
                warn("No weapon detected or weapon not found: " .. tostring(lastWpn))
                Rayfield:Notify({
                    Title = "Error",
                    Content = "No weapon detected or weapon not found.",
                    Duration = 3,
                })
            end
        end,
    })

    GunModTab:CreateButton({
        Name = "Modify Without Ammo",
        Callback = function()
            local player = game.Players.LocalPlayer
            local char = player.Character or player.CharacterAdded:Wait()
            if lastWpn and char:FindFirstChild(lastWpn) then
                local gun = char[lastWpn]
                gun:SetAttribute("Firerate", firerateValue)
                gun:SetAttribute("BulletSpeed", bulletSpeedValue)
                gun:SetAttribute("Spread", spreadValue)
                Rayfield:Notify({
                    Title = "Gun Modified",
                    Content = "Modified " .. lastWpn .. " without changing ammo!",
                    Duration = 3,
                })
            else
                warn("No weapon detected or weapon not found: " .. tostring(lastWpn))
                Rayfield:Notify({
                    Title = "Error",
                    Content = "No weapon detected or weapon not found.",
                    Duration = 3,
                })
            end
        end,
    })

    GunModTab:CreateButton({
        Name = "InfAmmo",
        Callback = function()
            local player = game.Players.LocalPlayer
            local char = player.Character or player.CharacterAdded:Wait()
            if lastWpn and char:FindFirstChild(lastWpn) then
                local gun = char[lastWpn]
                gun:GetAttributeChangedSignal("Ammo"):Connect(function()
                    print("Ammo for " .. lastWpn .. " has changed!")
                    gun:SetAttribute("Ammo", 999)
                end)
                Rayfield:Notify({
                    Title = "InfAmmo Enabled",
                    Content = "Infinite Ammo for " .. lastWpn,
                    Duration = 3,
                })
            else
                warn("No weapon detected or weapon not found: " .. tostring(lastWpn))
                Rayfield:Notify({
                    Title = "Error",
                    Content = "No weapon detected or weapon not found.",
                    Duration = 3,
                })
            end
        end,
    })

	-----------------------------
	-- ESP Tab: ESP Options --
	-----------------------------
	local ESP_Tab = Window:CreateTab("ESP 🔮")
	ESP_Tab:CreateSection("ESP Options")

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local enemyFolder = ReplicatedStorage.Units.Noobs
	local enemyNamesSet = {}
	for _, enemy in ipairs(enemyFolder:GetChildren()) do
		enemyNamesSet[enemy.Name] = true
	end

	-- Global settings
	_G.ESPColor = Color3.fromRGB(0, 255, 255)
	_G.ESPTextTransparency = _G.ESPTextTransparency or 0
	_G.ESPHighlightFillTransparency = _G.ESPHighlightFillTransparency or 0.5
	_G.ESPHighlightOutlineTransparency = _G.ESPHighlightOutlineTransparency or 0

	-- Table to store existing Text ESP objects
	local billboardESPObjects = {}

	-- Color Picker for ESP elements
	ESP_Tab:CreateColorPicker({
		Name = "ESP Color Picker",
		Color = _G.ESPColor,
		Flag = "ESPColorPicker",
		Callback = function(Value)
			_G.ESPColor = Value
			-- Update Text ESP color:
			for enemy, billboard in pairs(billboardESPObjects) do
				local textLabel = billboard:FindFirstChildOfClass("TextLabel")
				if textLabel then
					textLabel.TextColor3 = Value
				end
			end
			-- Update highlight colors for all ESP types:
			mech_setColor(Value)
			infantry_setColor(Value)
			boss_setColor(Value)
		end,
	})

	-- 1. Text ESP Transparency Slider
	ESP_Tab:CreateSlider({
		Name = "Text ESP Transparency",
		Range = {0, 1},
		Increment = 0.05,
		CurrentValue = _G.ESPTextTransparency,
		Callback = function(Value)
			_G.ESPTextTransparency = Value
			for enemy, billboard in pairs(billboardESPObjects) do
				local textLabel = billboard:FindFirstChildOfClass("TextLabel")
				if textLabel then
					textLabel.TextTransparency = Value
				end
			end
		end,
	})

	-- 2. Highlight Fill Transparency Slider
	ESP_Tab:CreateSlider({
		Name = "Highlight Fill Transparency",
		Range = {0, 1},
		Increment = 0.05,
		CurrentValue = _G.ESPHighlightFillTransparency,
		Callback = function(Value)
			_G.ESPHighlightFillTransparency = Value
			for _, highlight in pairs(mechESP_highlightedObjects) do
				if highlight then
					highlight.FillTransparency = Value
				end
			end
			for _, highlight in pairs(infantryESP_highlightedObjects) do
				if highlight then
					highlight.FillTransparency = Value
				end
			end
			for _, highlight in pairs(bossESP_highlightedObjects) do
				if highlight then
					highlight.FillTransparency = Value
				end
			end
		end,
	})

	-- 3. Highlight Outline Transparency Slider
	ESP_Tab:CreateSlider({
		Name = "Highlight Outline Transparency",
		Range = {0, 1},
		Increment = 0.05,
		CurrentValue = _G.ESPHighlightOutlineTransparency,
		Callback = function(Value)
			_G.ESPHighlightOutlineTransparency = Value
			for _, highlight in pairs(mechESP_highlightedObjects) do
				if highlight then
					highlight.OutlineTransparency = Value
				end
			end
			for _, highlight in pairs(infantryESP_highlightedObjects) do
				if highlight then
					highlight.OutlineTransparency = Value
				end
			end
			for _, highlight in pairs(bossESP_highlightedObjects) do
				if highlight then
					highlight.OutlineTransparency = Value
				end
			end
		end,
	})


	function loadBigHeads()
		if not game:IsLoaded() then
			game.Loaded:Wait()
		end
		_G.ScriptEnabled = _G.ScriptEnabled
		local hookedParts = {}

		local function enforceTransparency(part)
			if hookedParts[part] then return end
			hookedParts[part] = true
			part:GetPropertyChangedSignal("Transparency"):Connect(function()
				if _G.ScriptEnabled then
					part.Transparency = _G.Transparency or 0.9
				end
			end)
		end

		local function updatePart(part, instance)
			if not part then return end

			task.spawn(function() -- Runs in the background to update in real time
				while _G.ScriptEnabled and part and part.Parent do
					part.Transparency = _G.Transparency or 0.9
					enforceTransparency(part)

					if instance.Name == "Jetpacker" then
						part.Size = Vector3.new(5, 5, 5)
					elseif instance.Name == "Sniper" then
						part.Size = Vector3.new(_G.SniperHeadSize or 6, _G.SniperHeadSize or 6, _G.SniperHeadSize or 6)
					elseif instance.Name == "Prometheus" then
						part.Size = Vector3.new(_G.PrometheusHeadSize or 6, _G.PrometheusHeadSize or 6, _G.PrometheusHeadSize or 6)
					else
						part.Size = Vector3.new(_G.EnemiesHeadSize or 8, _G.EnemiesHeadSize or 8, _G.EnemiesHeadSize or 8)
					end
					
					part.Massless = true
					part.CanCollide = false
					task.wait(0.1) -- Small delay to reduce performance impact
				end
			end)
		end

		local function processEnemy(instance)
			if instance.Name == "APU" or not enemyNamesSet[instance.Name] then return end
			local part = instance:FindFirstChild("Head")
			if part then
				updatePart(part, instance)
			end
		end

		for _, obj in ipairs(workspace:GetChildren()) do
			processEnemy(obj)
			task.wait(0.01)
		end

		workspace.ChildAdded:Connect(function(child)
			task.wait(0.05)
			processEnemy(child)
			task.wait(1)
		end)
	end

	function disableBigHeads()
		_G.ScriptEnabled = false
		for _, obj in ipairs(workspace:GetChildren()) do
			if game.Players.LocalPlayer and obj == game.Players.LocalPlayer.Character then
				-- Skip the player's character.
			else
				local head = obj:FindFirstChild("Head")
				if head then
					head.Size = Vector3.new(1, 1, 1)    -- Reset to default size.
					head.Transparency = 0              -- Fully opaque.
				end
			end
		end
	end



	------------------------------------------------
	-- Billboard ESP (Text ESP) Using BillboardGui --
	------------------------------------------------
	local function createBillboardESP(enemy)
		if not enemy:IsA("Model") then return end
		local head = enemy:FindFirstChild("Head")
		if not head then return end
		if enemy:FindFirstChild("ESPBillboard") then return end
		local billboard = Instance.new("BillboardGui")
		billboard.Name = "ESPBillboard"
		billboard.Adornee = head
		billboard.Size = UDim2.new(0, 100, 0, 50)
		billboard.AlwaysOnTop = true
		billboard.StudsOffset = Vector3.new(0, 3, 0)
		billboard.Parent = enemy
		local textLabel = Instance.new("TextLabel", billboard)
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.TextColor3 = _G.ESPColor
		textLabel.TextStrokeTransparency = 0.5
		textLabel.TextScaled = false
		textLabel.TextSize = 12
		textLabel.Text = enemy.Name
		textLabel.TextTransparency = _G.ESPTextTransparency
		billboardESPObjects[enemy] = billboard
	end
	local function enableBillboardESP()
		for _, obj in ipairs(workspace:GetChildren()) do
			if obj:IsA("Model") and enemyNamesSet[obj.Name] then
				createBillboardESP(obj)
			end
		end
		workspace.ChildAdded:Connect(function(child)
			if _G.TextESPEnabled and child:IsA("Model") and enemyNamesSet[child.Name] then
				task.wait(0.1)
				createBillboardESP(child)
			end
		end)
	end
	local function disableBillboardESP()
		for enemy, billboard in pairs(billboardESPObjects) do
			if billboard then
				billboard:Destroy()
			end
		end
		billboardESPObjects = {}
	end

	ESP_Tab:CreateToggle({
		Name = "Enable Text ESP",
		CurrentValue = false,
		Callback = function(Value)
			_G.TextESPEnabled = Value
			if Value then
				enableBillboardESP()
				Rayfield:Notify({
					Title = "Text ESP",
					Content = "Text ESP Enabled!",
					Duration = 3,
				})
			else
				disableBillboardESP()
				Rayfield:Notify({
					Title = "Text ESP",
					Content = "Text ESP Disabled!",
					Duration = 3,
				})
			end
		end,
	})

	------------------------------------------------
	-- Mech Enemy ESP (Highlight based) --
	------------------------------------------------
	local mechESP_enabled = false
	local mechESP_HighlightColor = _G.ESPColor
	local mechESP_highlightedObjects = {}

	local function mech_removeAllHighlights()
		for model, highlight in pairs(mechESP_highlightedObjects) do
			if highlight and highlight.Parent then
				highlight:Destroy()
			end
		end
		mechESP_highlightedObjects = {}
	end

	local function mech_updateAllHighlights()
		for _, highlight in pairs(mechESP_highlightedObjects) do
			if highlight then
				highlight.FillColor = mechESP_HighlightColor
				highlight.OutlineColor = mechESP_HighlightColor
			end
		end
	end

	function mech_setColor(newColor)
		mechESP_HighlightColor = newColor
		mech_updateAllHighlights()
	end

	local function mech_handleNewObject(obj)
		if not mechESP_enabled then return end
		if obj and obj.Parent and obj.Parent:IsA("Model") then
			local model = obj.Parent
			local modelName = model.Name
			if (obj:IsA("UnionOperation") and modelName == "Platform") or 
			(obj:IsA("Part") and (modelName == "APU" or modelName == "Tank" or modelName == "Ranger")) then
				if not mechESP_highlightedObjects[model] then
					local highlight = Instance.new("Highlight")
					highlight.Parent = model
					highlight.Adornee = model
					highlight.FillTransparency = _G.ESPHighlightFillTransparency
					highlight.OutlineTransparency = _G.ESPHighlightOutlineTransparency
					highlight.FillColor = mechESP_HighlightColor
					highlight.OutlineColor = mechESP_HighlightColor
					mechESP_highlightedObjects[model] = highlight
				end
			end
		end
	end

	local function mech_handleExistingObjects()
		if not mechESP_enabled then return end
		for _, obj in ipairs(workspace:GetDescendants()) do
			mech_handleNewObject(obj)
		end
	end

	workspace.DescendantRemoving:Connect(function(descendant)
		if descendant:IsA("Model") and (descendant.Name == "Platform") then
			if mechESP_highlightedObjects[descendant] then
				mechESP_highlightedObjects[descendant]:Destroy()
				mechESP_highlightedObjects[descendant] = nil
			end
		end
	end)

	workspace.ChildAdded:Connect(function(child)
		mech_handleNewObject(child)
	end)

	local mech_lastCheck = 0
	RunService.Heartbeat:Connect(function(deltaTime)
		if mechESP_enabled then
			mech_lastCheck = mech_lastCheck + deltaTime
			if mech_lastCheck >= 0.5 then
				mech_handleExistingObjects()
				mech_lastCheck = 0
			end
		end
	end)

	local function mech_setToggle(Value)
		mechESP_enabled = Value
		if not mechESP_enabled then
			mech_removeAllHighlights()
		else
			mech_handleExistingObjects()
		end
	end

	ESP_Tab:CreateToggle({
		Name = "Enable Mech Enemy ESP",
		CurrentValue = false,
		Callback = function(Value)
			mech_setToggle(Value)
			if Value then
				Rayfield:Notify({
					Title = "Mech Enemy ESP",
					Content = "Mech Enemy ESP Enabled!",
					Duration = 3,
				})
			else
				Rayfield:Notify({
					Title = "Mech Enemy ESP",
					Content = "Mech Enemy ESP Disabled!",
					Duration = 3,
				})
			end
		end,
	})

	------------------------------------------------
	-- Infantry ESP (Highlight based, excluding Heads) --
	------------------------------------------------
	local infantryESP_enabled = false
	local infantryESP_HighlightColor = _G.ESPColor
	-- Use a nested table: [model] = { [part] = highlight, ... }
	local infantryESP_highlightedObjects = {}

	local infantryNames = {
		Grenadier = true,
		Infantry = true,
		Cloaker = true,
		Shielder = true,
		Saboteur = true,
		Gunner = true,
		Sniper = true,
		Jetpacker = true,
		Engineer = true,
		Tranquilizer = true,
		Medic = true,
		Administrator = true,
		Sentry = true,
		Teleporter = true,
	}

	local function infantry_removeAllHighlights()
		for model, partsTable in pairs(infantryESP_highlightedObjects) do
			for part, highlight in pairs(partsTable) do
				if highlight and highlight.Parent then
					highlight:Destroy()
				end
			end
		end
		infantryESP_highlightedObjects = {}
	end

	local function infantry_updateAllHighlights()
		for model, partsTable in pairs(infantryESP_highlightedObjects) do
			for part, highlight in pairs(partsTable) do
				if highlight then
					highlight.FillColor = infantryESP_HighlightColor
					highlight.OutlineColor = infantryESP_HighlightColor
				end
			end
		end
	end

	function infantry_setColor(newColor)
		infantryESP_HighlightColor = newColor
		infantry_updateAllHighlights()
	end

	local function infantry_handleNewObject(obj)
		if not infantryESP_enabled then return end
		if obj and obj.Parent and obj.Parent:IsA("Model") then
			local model = obj.Parent
			if infantryNames[model.Name] then
				-- Only create a highlight for parts not named "Head"
				if obj:IsA("Part") and obj.Name ~= "Head" then
					if not infantryESP_highlightedObjects[model] then
						infantryESP_highlightedObjects[model] = {}
					end
					if not infantryESP_highlightedObjects[model][obj] then
						local highlight = Instance.new("Highlight")
						highlight.Parent = model
						highlight.Adornee = obj
						highlight.FillTransparency = _G.ESPHighlightFillTransparency
						highlight.OutlineTransparency = _G.ESPHighlightOutlineTransparency
						highlight.FillColor = infantryESP_HighlightColor
						highlight.OutlineColor = infantryESP_HighlightColor
						infantryESP_highlightedObjects[model][obj] = highlight
					end
				end
			end
		end
	end

	local function infantry_handleExistingObjects()
		if not infantryESP_enabled then return end
		for _, obj in ipairs(workspace:GetDescendants()) do
			infantry_handleNewObject(obj)
		end
	end

	workspace.DescendantRemoving:Connect(function(descendant)
		if descendant:IsA("Model") and infantryNames[descendant.Name] then
			if infantryESP_highlightedObjects[descendant] then
				for part, highlight in pairs(infantryESP_highlightedObjects[descendant]) do
					if highlight then
						highlight:Destroy()
					end
				end
				infantryESP_highlightedObjects[descendant] = nil
			end
		end
	end)

	workspace.ChildAdded:Connect(function(child)
		infantry_handleNewObject(child)
	end)

	local infantry_lastCheck = 0
	RunService.Heartbeat:Connect(function(deltaTime)
		if infantryESP_enabled then
			infantry_lastCheck = infantry_lastCheck + deltaTime
			if infantry_lastCheck >= 0.5 then
				infantry_handleExistingObjects()
				infantry_lastCheck = 0
			end
		end
	end)

	local function infantry_setToggle(Value)
		infantryESP_enabled = Value
		if not infantryESP_enabled then
			infantry_removeAllHighlights()
		else
			infantry_handleExistingObjects()
		end
	end

	ESP_Tab:CreateToggle({
		Name = "Enable Infantry ESP",
		CurrentValue = false,
		Callback = function(Value)
			infantry_setToggle(Value)
			if Value then
				Rayfield:Notify({
					Title = "Infantry ESP",
					Content = "Infantry ESP Enabled!",
					Duration = 3,
				})
			else
				Rayfield:Notify({
					Title = "Infantry ESP",
					Content = "Infantry ESP Disabled!",
					Duration = 3,
				})
			end
		end,
	})

	------------------------------------------------
    -- Boss ESP (Highlight based, excluding Heads) --
    ------------------------------------------------
    local bossESP_enabled = false
    local bossESP_HighlightColor = _G.ESPColor
    -- We'll store highlights in a table where each model maps to a table of highlights for its parts.
    local bossESP_highlightedObjects = {}
    
    local bossNames = {
        Daedalus = true,
        Hermes = true,
        Tempest = true,
        Fusilier = true,
        Gaia = true,
        Prometheus = true,
        Achilles = true,
        Trident = true,
        Sparta = true,
        Ares = true,
    }
    
    local function boss_removeAllHighlights()
        for model, partsTable in pairs(bossESP_highlightedObjects) do
            for _, hl in pairs(partsTable) do
                if hl and hl.Parent then
                    hl:Destroy()
                end
            end
        end
        bossESP_highlightedObjects = {}
    end
    
    local function boss_updateAllHighlights()
        for _, partsTable in pairs(bossESP_highlightedObjects) do
            for _, hl in pairs(partsTable) do
                if hl then
                    hl.FillColor = bossESP_HighlightColor
                    hl.OutlineColor = bossESP_HighlightColor
                end
            end
        end
    end
    
    function boss_setColor(newColor)
        bossESP_HighlightColor = newColor
        boss_updateAllHighlights()
    end
    
    local function boss_handleNewObject(obj)
        if not bossESP_enabled then return end
        if obj and obj.Parent and obj.Parent:IsA("Model") then
            local model = obj.Parent
            if bossNames[model.Name] then
                -- Iterate over each BasePart in the model except those named "Head"
                for _, part in ipairs(model:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name ~= "Head" then
                        if not bossESP_highlightedObjects[model] then
                            bossESP_highlightedObjects[model] = {}
                        end
                        if not bossESP_highlightedObjects[model][part] then
                            local highlight = Instance.new("Highlight")
                            highlight.Parent = model
                            highlight.Adornee = part
                            highlight.FillTransparency = _G.ESPHighlightFillTransparency
                            highlight.OutlineTransparency = _G.ESPHighlightOutlineTransparency
                            highlight.FillColor = bossESP_HighlightColor
                            highlight.OutlineColor = bossESP_HighlightColor
                            bossESP_highlightedObjects[model][part] = highlight
                        end
                    end
                end
            end
        end
    end
    
    local function boss_handleExistingObjects()
        if not bossESP_enabled then return end
        for _, obj in ipairs(workspace:GetDescendants()) do
            boss_handleNewObject(obj)
        end
    end
    
    workspace.DescendantRemoving:Connect(function(descendant)
        if descendant:IsA("Model") and bossNames[descendant.Name] then
            if bossESP_highlightedObjects[descendant] then
                for _, hl in pairs(bossESP_highlightedObjects[descendant]) do
                    if hl then hl:Destroy() end
                end
                bossESP_highlightedObjects[descendant] = nil
            end
        end
    end)
    
    workspace.ChildAdded:Connect(function(child)
        boss_handleNewObject(child)
    end)
    
    local boss_lastCheck = 0
    RunService.Heartbeat:Connect(function(deltaTime)
        if bossESP_enabled then
            boss_lastCheck = boss_lastCheck + deltaTime
            if boss_lastCheck >= 0.5 then
                boss_handleExistingObjects()
                boss_lastCheck = 0
            end
        end
    end)
    
    local function boss_setToggle(Value)
        bossESP_enabled = Value
        if not bossESP_enabled then
            boss_removeAllHighlights()
        else
            boss_handleExistingObjects()
        end
    end
    
    ESP_Tab:CreateToggle({
        Name = "Enable Boss ESP",
        CurrentValue = false,
        Callback = function(Value)
            boss_setToggle(Value)
            if Value then
                Rayfield:Notify({
                    Title = "Boss ESP",
                    Content = "Boss ESP Enabled!",
                    Duration = 3,
                })
            else
                Rayfield:Notify({
                    Title = "Boss ESP",
                    Content = "Boss ESP Disabled!",
                    Duration = 3,
                })
            end
        end,
    })


    ------------------------------------------------
	-- Landmine esp 
	------------------------------------------------
    -- Made by mrpopcat14 (Modified by ChatGPT)
    local RunService = game:GetService("RunService")
    
    -- Table to keep track of highlighted objects
    local highlightedObjects = {}
    
    local landmineESP_enabled = false
    local LANDMINE_ESP_COLOR = Color3.fromRGB(160, 32, 240)
    
    local function handleNewObject(obj)
        if not landmineESP_enabled then return end
        if obj:IsA('Part') and obj.Parent and obj.Parent:IsA('Model') and obj.Parent.Name:lower() == 'landmine' then
            local landmine = obj.Parent
            if not highlightedObjects[landmine] then
                local highlight = Instance.new('Highlight')
                highlight.Parent = landmine
                highlight.Adornee = landmine
                highlight.FillTransparency = 0.2
                highlight.OutlineTransparency = 0
                highlight.FillColor = LANDMINE_ESP_COLOR
                highlight.OutlineColor = LANDMINE_ESP_COLOR
    
                highlightedObjects[landmine] = highlight
            end
        end
    end
    
    local function handleExistingObjects()
        if not landmineESP_enabled then return end
        for _, obj in ipairs(game.Workspace:GetDescendants()) do
            handleNewObject(obj)
        end
    end
    
    game.Workspace.DescendantRemoving:Connect(function(descendant)
        if descendant:IsA('Model') and descendant.Name:lower() == 'landmine' then
            if highlightedObjects[descendant] then
                highlightedObjects[descendant]:Destroy()
                highlightedObjects[descendant] = nil
            end
        end
    end)
    
    game.Workspace.ChildAdded:Connect(function(child)
        handleNewObject(child)
    end)
    
    local lastCheck = 0
    RunService.Heartbeat:Connect(function(deltaTime)
        if landmineESP_enabled then
            lastCheck = lastCheck + deltaTime
            if lastCheck >= 0.5 then
                handleExistingObjects()
                lastCheck = 0
            end
        end
    end)
    
    local function setLandmineESP(enabled)
        landmineESP_enabled = enabled
        if not enabled then
            for model, highlight in pairs(highlightedObjects) do
                if highlight then
                    highlight:Destroy()
                end
            end
            highlightedObjects = {}
        else
            handleExistingObjects()
        end
    end
    
    -- Toggle for Land Mine ESP (Rayfield UI style)
    ESP_Tab:CreateToggle({
        Name = "Enable Land Mine ESP",
        CurrentValue = false,
        Callback = function(Value)
            setLandmineESP(Value)
            if Value then
                Rayfield:Notify({
                    Title = "Land Mine ESP",
                    Content = "Land Mine ESP Enabled!",
                    Duration = 3,
                })
            else
                Rayfield:Notify({
                    Title = "Land Mine ESP",
                    Content = "Land Mine ESP Disabled!",
                    Duration = 3,
                })
            end
        end,
    })

	local RunService = game:GetService("RunService")

	RunService.Heartbeat:Connect(function()
	-- Update Text ESP transparency in real time
	for enemy, billboard in pairs(billboardESPObjects) do
		local textLabel = billboard:FindFirstChildOfClass("TextLabel")
		if textLabel then
			textLabel.TextTransparency = _G.ESPTextTransparency
		end
	end

	-- Update Mech ESP transparency in real time
	for _, highlight in pairs(mechESP_highlightedObjects) do
		if highlight then
			highlight.FillTransparency = _G.ESPHighlightFillTransparency
			highlight.OutlineTransparency = _G.ESPHighlightOutlineTransparency
		end
	end

	-- Update Infantry ESP transparency in real time
	for _, partsTable in pairs(infantryESP_highlightedObjects) do
		for _, hl in pairs(partsTable) do
			if hl then
				hl.FillTransparency = _G.ESPHighlightFillTransparency
				hl.OutlineTransparency = _G.ESPHighlightOutlineTransparency
			end
		end
	end

	-- Update Boss ESP transparency in real time
	for _, partsTable in pairs(bossESP_highlightedObjects) do
		for _, hl in pairs(partsTable) do
			if hl then
				hl.FillTransparency = _G.ESPHighlightFillTransparency
				hl.OutlineTransparency = _G.ESPHighlightOutlineTransparency
			end
		end
	end

end)
end
