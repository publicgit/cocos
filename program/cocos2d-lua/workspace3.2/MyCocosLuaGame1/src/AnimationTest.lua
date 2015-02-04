require "Cocos2d"
require "Cocos2dConstants"

-- 动画测试
-- author jacc
local AnimationTest = class("AnimationTest",function()
    return cc.Scene:create()
end)

function AnimationTest.create()
 
    local function createTestLayer()
        local layerTest = cc. Layer:create()
        
        -- 加载动画-资源
        ccs.ArmatureDataManager:getInstance():addArmatureFileInfo( "res/test_1/Hero/Hero0.png", "res/test_1/Hero/Hero0.plist", "res/test_1/Hero/Hero.ExportJson" )
        
        -- 创建动画对象
        local armature = ccs.Armature:create("Hero")
        
        --设置位置
        --armature:setPosition( origin.x + visibleSize.width / 3, origin.y + visibleSize.height / 5 )
        armature:setPosition(50,136)
        armature:setPositionX(200)
        armature:setPositionX(200)
        
        -- 播放动画, 播放指定动作
        --armature:getAnimation():play("attack")
        
        -- 添加到游戏中
        layerTest:addChild(armature)
        
        
        -- 帧事件回调
        do
            local killEventCount = 0 -- 计算事件发生数量
            local killEventLabel = cc.Label:create()
            killEventLabel:setString( "Kill Event Count: 0" )
            killEventLabel:setPosition( cc.p( 50, 85 ) )
            layerTest:addChild( killEventLabel )
            
            -- 添加帧事件回调
            armature:getAnimation():setFrameEventCallFunc( 
                function ( bone, evt, originFrameIndex, currentFrameIndex )
                    if evt == "kill" then -- 判断帧事件名称是否为kill
                        killEventCount = killEventCount + 1
                        -- 更新输出显示
                        killEventLabel:setString("Kill Event Count: " .. killEventCount)
                    end
                end 
            )
        end
        
        
        -- 动画事件回调
        do
            local moveEventLabel = cc.Label:create()
            moveEventLabel:setString( "" )
            moveEventLabel:setPosition( cc.p( 100, 100 ) )
            layerTest:addChild( moveEventLabel );
            
            -- 添加帧事件回调
            armature:getAnimation():setMovementEventCallFunc(
                function (arm, eventType, movmentID)
                    local actionType = "Start Event"
                    if eventType == ccs.MovementEventType.start then
                        actionType = "Start Event"
                    elseif eventType == ccs.MovementEventType.complete then
                        actionType = "Complete Event"
                    elseif eventType == ccs.MovementEventType.loopComplete then
                        actionType = "LoopComplete Event"
                    end
                    -- 更新输出显示
                    moveEventLabel:setString( "Got Event " .. movmentID .. " " .. actionType )
                end
            )
        end
       
       
        -- 我们要实现触摸后切换动画-
        local currentIndex = 0
        -- 获取动作列表数量
        local animationListCount = armature:getAnimation():getMovementCount()
        
        -- 接受触摸
        local function onTouchBegan( touch, event )
            return true
        end
        
        -- 触摸结束后切换动画
        local function onTouchEnded( touch, event )
            -- 通过播放动画
            armature:getAnimation():playWithIndex( currentIndex )
            currentIndex = currentIndex + 1
            if currentIndex >= animationListCount then
                currentIndex = 0
            end
        end
        
        -- 监听触摸事件
        local listener = cc.EventListenerTouchOneByOne:create()
        listener:registerScriptHandler( onTouchBegan, cc.Handler.EVENT_TOUCH_BEGAN )
        listener:registerScriptHandler( onTouchEnded, cc.Handler.EVENT_TOUCH_ENDED)
        local eventDispatcher = layerTest:getEventDispatcher()
        eventDispatcher:addEventListenerWithSceneGraphPriority(listener,layerTest)
       
       
        -- 换装的实现
        -- 生成新的皮肤(这里指装备)
        local skin1 = ccs.Skin:create("res/test_1/weapon/weapon1tex.png")
        local skin2 = ccs.Skin:create("res/test_1/weapon/weapon2tex.png")
        
        -- 获取到装备的骨骼, 并添加新的显示
        local bone = armature:getBone( "Layer17" )
        bone:addDisplay( skin1, 1 )
        bone:addDisplay( skin2, 2 )
        
        -- 创建菜单
        local function createLayerMenu()
            local menu = cc.Menu:create();
            local label = cc.Label:create()
            label:setString( "ChangeDisplay" )
            local menuChangeDisplay = cc.MenuItemLabel:create( label )
            menuChangeDisplay:setPosition( cc.p( 0, 0 ) )
            
            -- 换装中装备显示的Index
            local displayIndex = 0
            menuChangeDisplay:registerScriptTapHandler(
                function()
                    displayIndex = displayIndex + 1
                    if displayIndex > 2 then
                        displayIndex = 0
                    end
                    -- 换装
                    bone:changeDisplayWithIndex( displayIndex, true )
                end
            )
            menu:setAnchorPoint( cc.p( 0, 0 ) )
            menu:setPosition( cc.p( 50, 300 ) )
            menu:addChild( menuChangeDisplay )
            return menu
        end
       
       layerTest:addChild( createLayerMenu() )
       
        -- 播放动画, 播放指定动作
        armature:getAnimation():play("attack")
        
        return layerTest
    end
    
    local scene = AnimationTest.new()
    scene:addChild( createTestLayer() )
    
    return scene
end

function AnimationTest.LoadAnimation()
   
end

return AnimationTest