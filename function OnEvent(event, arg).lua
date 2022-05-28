function OnEvent(event, arg)
    -- range to response gesture
    local range = 1000
    -- 多任务：绑定为鼠标4号键(下侧键)按下
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then    
        --OutputLogMessage("key6 is pressed")
        --direction:0->dischange 1->left -1->right 2->up -2->down
        local direction = getDirection(range)

        if (direction == 0) then
            -- base func: back
            PressKey("lalt")
            PressKey("left")
            ReleaseKey("lalt", "left")
        end    

        if (direction == 1) then
            -- 左向手势：下一个桌面
            --OutputLogMessage("enter left\n")
            PressKey("lctrl", "lgui")
            PressKey("right")
            ReleaseKey("lctrl", "lgui", "right")
        end    

        if (direction == -1) then
            -- 右向手势：上一个桌面
            --OutputLogMessage("enter right\n")
            PressKey("lctrl", "lgui")
            PressKey("left")
            ReleaseKey("lctrl", "lgui", "left")
        end
        
        if (direction == 2) then
            -- 上向手势：多任务中心
            --OutputLogMessage("enter up\n")
            PressKey("lgui")
            PressKey("tab")
            ReleaseKey("lgui", "tab")
        end
        
        if (direction == -2) then
            -- 下向手势：开始菜单
            --OutputLogMessage("enter down\n")
            PressAndReleaseKey("lgui")
        end

    end

    -- 快捷操作：绑定为鼠标5号键(上侧键)按下
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 5) then    
        --OutputLogMessage("key5 is pressed")
        --direction:0->dischange 1->left -1->right 2->up -2->down
        local direction = getDirection(range)

        if (direction == 0) then
            -- base func: forward
            PressKey("lalt")
            PressKey("right")
            ReleaseKey("lalt", "right")
        end    

        if (direction == 1) then
            -- 左向手势：powerToys 窗口始终置顶
            --OutputLogMessage("enter left\n")
            PressKey("lgui")
            PressKey("lalt")
            PressKey("e")
            ReleaseKey("lgui", "lalt", "e")
        end    

        if (direction == -1) then
            -- 右向手势：控制中心
            --OutputLogMessage("enter right\n")
            PressKey("lgui")
            PressKey("a")
            ReleaseKey("lgui", "a")
        end
        
        if (direction == 2) then
            -- 上向手势：打开资源管理器
            --OutputLogMessage("enter up\n")
            PressKey("lgui")
            PressKey("e")
            ReleaseKey("lgui", "e")
        end
        
        if (direction == -2) then
            -- 下向手势：powerToys Run
            --OutputLogMessage("enter down\n")
            PressKey("lalt")
            PressKey("spacebar")
            ReleaseKey("lalt", "spacebar")
        end

    end
end


--direction:0->dischange 1->left -1->right 2->up -2->down
function getDirection(range)
    local old_x, old_y = GetMousePosition()
    Sleep(100)
    local new_x, new_y = GetMousePosition()
    local x = new_x - old_x
    local y= new_y - old_y

    local direction = 0
    if ( math.abs(x) > math.abs(y) ) then
        if(x < -range) then 
            direction = 1
        elseif(x > range) then
            direction = -1
        end    
    elseif( math.abs(x) < math.abs(y) ) then
        if(y < -range) then
            direction = 2
    elseif(y > range) then
            direction = -2
        end        
    end
    return direction
end    