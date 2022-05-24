function OnEvent(event, arg)
    --OutputLogMessage("Event: "..event.." Arg: "..arg.."\n")
    -- 多任务：绑定为鼠标4号键(下侧键)按下
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then    
        --OutputLogMessage("key6 is pressed")
        local old_x, old_y = GetMousePosition()
        Sleep(100)
        local new_x, new_y = GetMousePosition()
        
        local x = new_x - old_x
        local y= new_y - old_y
        --OutputLogMessage("%d, %d\n", x, y)

        if ( ((x >= 0 and x < 2500) or (x <= 0 and x > -2500)) and ((y >= 0 and y < 2500) or (y <= 0 and y > -2500)) ) then
            -- base func: back
            PressKey("lalt")
            PressKey("left")
            ReleaseKey("lalt", "left")
        end    

        if (x < -1000 and ((y >= 0 and y < 2500) or (y <= 0 and y > -2500))) then
            -- 左向手势：下一个桌面
            --OutputLogMessage("enter left\n")
            PressKey("lctrl", "lgui")
            PressKey("right")
            ReleaseKey("lctrl", "lgui", "right")
        end    

        if (x > 1000 and ((y >= 0 and y < 2500) or (y <= 0 and y > -2500))) then
            -- 右向手势：上一个桌面
            --OutputLogMessage("enter right\n")
            PressKey("lctrl", "lgui")
            PressKey("left")
            ReleaseKey("lctrl", "lgui", "left")
        end
        
        if (y < -1000 and ((x >= 0 and x < 2500) or (x <= 0 and x > -2500))) then
            -- 上向手势：多任务中心
            --OutputLogMessage("enter up\n")
            PressKey("lgui")
            PressKey("tab")
            ReleaseKey("lgui", "tab")
        end
        
        if (y > 1000 and ((x >= 0 and x < 2500) or (x <= 0 and x > -2500))) then
            -- 下向手势：开始菜单
            --OutputLogMessage("enter down\n")
            PressAndReleaseKey("lgui")
        end

    end

    -- 快捷操作：绑定为鼠标5号键(上侧键)按下
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 5) then    
        --OutputLogMessage("key5 is pressed")
        local old_x, old_y = GetMousePosition()
        Sleep(100)
        local new_x, new_y = GetMousePosition()
        
        local x = new_x - old_x
        local y= new_y - old_y
        --OutputLogMessage("%d, %d\n", x, y)

        if ( ((x >= 0 and x < 2500) or (x <= 0 and x > -2500)) and ((y >= 0 and y < 2500) or (y <= 0 and y > -2500)) ) then
            -- base func: forward
            PressKey("lalt")
            PressKey("right")
            ReleaseKey("lalt", "right")
        end    

        if (x < -1000 and ((y >= 0 and y < 2500) or (y <= 0 and y > -2500))) then
            -- 左向手势：小组件
            --OutputLogMessage("enter left\n")
            PressKey("lgui")
            PressKey("w")
            ReleaseKey("lgui", "w")
        end    

        if (x > 1000 and ((y >= 0 and y < 2500) or (y <= 0 and y > -2500))) then
            -- 右向手势：控制中心
            --OutputLogMessage("enter right\n")
            PressKey("lgui")
            PressKey("a")
            ReleaseKey("lgui", "a")
        end
        
        if (y < -1000 and ((x >= 0 and x < 2500) or (x <= 0 and x > -2500))) then
            -- 上向手势：打开文件夹
            --OutputLogMessage("enter up\n")
            PressKey("lgui")
            PressKey("e")
            ReleaseKey("lgui", "e")
        end
        
        if (y > 1000 and ((x >= 0 and x < 2500) or (x <= 0 and x > -2500))) then
            -- 下向手势：搜索
            --OutputLogMessage("enter down\n")
            PressKey("lgui")
            PressKey("s")
            ReleaseKey("lgui", "s")
        end

    end
end
