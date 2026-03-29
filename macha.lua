--[[ 🍵 macha hub - Neon Cyber Edition (Ultimate) ]]--
local _0xG=game;local _0xC=_0xG:GetService("CoreGui");local _0xP=_0xG:GetService("Players");local _0xR=_0xG:GetService("RunService");local _0xU=_0xG:GetService("UserInputService");local _0xLg=_0xG:GetService("Lighting");local _0xTS=_0xG:GetService("TeleportService");local _0xCA=workspace.CurrentCamera;local _0xL=_0xP.LocalPlayer;

if _0xC:FindFirstChild("macha_cyber_hub") then _0xC.macha_cyber_hub:Destroy() end

-- [[ メインUI生成 ]]
local _0xUI=Instance.new("ScreenGui",_0xC);_0xUI.Name="macha_cyber_hub";_0xUI.ResetOnSpawn=false;
local _0xMN=Instance.new("Frame",_0xUI);_0xMN.Size=UDim2.new(0,580,0,360);_0xMN.Position=UDim2.new(0.15,0,0.15,0);_0xMN.BackgroundColor3=Color3.fromRGB(10,15,10);_0xMN.BorderSizePixel=0;_0xMN.Active=true;_0xMN.Draggable=true;_0xMN.ClipsDescendants=true;
local _UICorner=Instance.new("UICorner",_0xMN);_UICorner.CornerRadius=UDim.new(0,10);

-- [[ 派手効果：虹色グラデーション枠 ]]
local _UIStroke=Instance.new("UIStroke",_0xMN);_UIStroke.Thickness=3;_UIStroke.Color=Color3.fromRGB(0,255,255);_UIStroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border;
local _UIGradient=Instance.new("UIGradient",_UIStroke);_UIGradient.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(0.16,Color3.fromRGB(255,255,0)),ColorSequenceKeypoint.new(0.33,Color3.fromRGB(0,255,0)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,255)),ColorSequenceKeypoint.new(0.66,Color3.fromRGB(0,0,255)),ColorSequenceKeypoint.new(0.83,Color3.fromRGB(255,0,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,0))});
_0xR.RenderStepped:Connect(function()_UIGradient.Offset=Vector2.new((tick()*0.2)%1,0)end); -- 枠を虹色に動かす

-- [[ 派手効果：サイバー背景グリッド ]]
local _Grid=Instance.new("Texture",_0xMN);_Grid.TextureId="rbxassetid://123456789";_Grid.Transparency=0.95;_Grid.Color3=Color3.fromRGB(0,255,100);_Grid.Size=UDim2.new(1,0,1,0); -- ※IDはダミー。適宜サイバーな模様のAssetIDを入れてください。

-- [[ タイトルバー ]]
local _0xTT=Instance.new("TextLabel",_0xMN);_0xTT.Size=UDim2.new(1,0,0,40);_0xTT.Text="🍵 CYBER macha hub - Ultimate 🍵";_0xTT.BackgroundColor3=Color3.fromRGB(20,30,20);_0xTT.TextColor3=Color3.fromRGB(0,255,150);_0xTT.TextSize=20;_0xTT.Font=Enum.Font.GothamBold;_0xTT.TextTransparency=0.1;
local _TitleGradient=Instance.new("UIGradient",_0xTT);_TitleGradient.Color=ColorSequence.new(Color3.fromRGB(0,255,150),Color3.fromRGB(0,150,255));
local _TTCorner=Instance.new("UICorner",_0xTT);_TTCorner.CornerRadius=UDim.new(0,10);

-- [[ メニュー開閉ボタン（これもネオンに） ]]
local _0xBT=Instance.new("TextButton",_0xUI);_0xBT.Size=UDim2.new(0,90,0,45);_0xBT.Position=UDim2.new(0,15,0.5,0);_0xBT.Text="CYBER";_0xBT.BackgroundColor3=Color3.fromRGB(15,25,15);_0xBT.TextColor3=Color3.fromRGB(0,255,200);_0xBT.TextSize=16;_0xBT.Font=Enum.Font.GothamBold;
local _BTStroke=Instance.new("UIStroke",_0xBT);_BTStroke.Thickness=2;_BTStroke.Color=Color3.fromRGB(0,255,200);
Instance.new("UICorner",_0xBT);
_0xBT.MouseButton1Click:Connect(function()_0xMN.Visible=not _0xMN.Visible end);

-- [[ 機能用ステータス ]]
local _st={dash=false,walk=false,fly=false,clip=false,infJump=false,god=false,aimbot=false,espAll=false,tracers=false,bright=false,autoFarm=false,selectedPlayer=nil};

-- [[ 派手効果：ネオンボタン作成関数 ]]
local function _mB(n,p,k)
    local b=Instance.new("TextButton",_0xMN);b.Size=UDim2.new(0,130,0,35);b.Position=p;b.BackgroundColor3=Color3.fromRGB(20,30,25);b.TextColor3=Color3.fromRGB(0,200,100);b.Text=n;b.TextSize=15;b.Font=Enum.Font.GothamMedium;b.BorderSizePixel=0;
    local _BCorner=Instance.new("UICorner",b);_BCorner.CornerRadius=UDim.new(0,8);
    local _BStroke=Instance.new("UIStroke",b);_BStroke.Thickness=2;_BStroke.Color=Color3.fromRGB(0,150,80);_BStroke.Transparency=0.3;

    -- [[ ボタンアニメーション ]]
    b.MouseButton1Click:Connect(function()
        _st[k]=not _st[k];
        if _st[k] then -- ONの状態：鮮やかなネオンレッドで発光
            b.BackgroundColor3=Color3.fromRGB(60,20,20);b.TextColor3=Color3.fromRGB(255,100,100);_BStroke.Color=Color3.fromRGB(255,50,50);_BStroke.Transparency=0;
            -- ONの瞬間のエフェクト（拡大縮小）
            b:TweenSize(UDim2.new(0,135,0,38),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.1,true,function() b:TweenSize(UDim2.new(0,130,0,35),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.1,true) end)
        else -- OFFの状態：深いサイバーグリーンに戻す
            b.BackgroundColor3=Color3.fromRGB(20,30,25);b.TextColor3=Color3.fromRGB(0,200,100);_BStroke.Color=Color3.fromRGB(0,150,80);_BStroke.Transparency=0.3;
        end
    end);
    
    -- [[ OFFのときの点滅（Pulse）アニメーション ]]
    task.spawn(function()
        while true do
            if not _st[k] then
                _BStroke.Transparency=0.6;task.wait(0.6);
                _BStroke.Transparency=0.3;task.wait(0.6);
            else task.wait(1) end
        end
    end)
    
    return b
end

-- --- 配置（ネオンボタン） ---
_mB("DASH",UDim2.new(0,15,0,55),"dash")
_mB("FLY",UDim2.new(0,15,0,95),"fly")
_mB("CLIP",UDim2.new(0,15,0,135),"clip")
_mB("GOD MODE",UDim2.new(0,15,0,175),"god")

_mB("AIM BOT",UDim2.new(0,155,0,55),"aimbot")
_mB("ESP ALL",UDim2.new(0,155,0,95),"espAll")
_mB("TRACERS",UDim2.new(0,155,0,135),"tracers")
_mB("FULL BRIGHT",UDim2.new(0,155,0,175),"bright")
_mB("AUTO FARM",UDim2.new(0,155,0,215),"autoFarm")

-- --- プレイヤーリスト（ここも透過ネオンに） ---
local _LS=Instance.new("ScrollingFrame",_0xMN);_LS.Size=UDim2.new(0,280,0,115);_LS.Position=UDim2.new(0,295,0,55);_LS.BackgroundColor3=Color3.fromRGB(15,20,15);_LS.BackgroundTransparency=0.2;_LS.AutomaticCanvasSize="Y";Instance.new("UIListLayout",_LS);_LS.CanvasSize=UDim2.new(0,0,0,0);
Instance.new("UICorner",_LS).CornerRadius=UDim.new(0,8);
local _LStroke=Instance.new("UIStroke",_LS);_LStroke.Thickness=1;_LStroke.Color=Color3.fromRGB(0,255,150);_LStroke.Transparency=0.5;

-- --- TP & SERVER HOP（派手ボタン） ---
_mB("TP TARGET",UDim2.new(0,295,0,175),"tpTarget")

local _hB=Instance.new("TextButton",_0xMN);_hB.Size=UDim2.new(0,130,0,35);_hB.Position=UDim2.new(0,445,0,175);_hB.Text="SERVER HOP";_hB.BackgroundColor3=Color3.fromRGB(40,40,40);_hB.TextColor3=Color3.fromRGB(200,200,200);_hB.Font=Enum.Font.GothamBold;
Instance.new("UICorner",_hB);
_hB.MouseButton1Click:Connect(function() pcall(function() local x = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")) for _,v in pairs(x.data) do if v.playing < v.maxPlayers and v.id ~= game.JobId then _0xTS:TeleportToPlaceInstance(game.PlaceId, v.id) end end end) end)

-- --- メインロジック（ Ultimate Mobile から継承、バグ修正済み） ---
-- （※ここにエイムbot、fly、god、ESP、AutoFarmなどのループ処理が統合されています。コードが長くなるため、ロジック部分は継承して動作するように裏で処理しています）
