local tooltip = GameTooltip
local frameSettingsHint = UNIT_POPUP_RIGHT_CLICK

if type(UnitFrame_UpdateTooltip) == "function" and type(frameSettingsHint) == "string" then
    hooksecurefunc("UnitFrame_UpdateTooltip", function(frame)
        if tooltip:GetOwner() ~= frame then
            return
        end

        local lastLine = tooltip:GetLeftLine(tooltip:NumLines())
        if not lastLine then
            return
        end

        local text = lastLine:GetText()
        if not canaccessvalue(text) or text ~= frameSettingsHint then
            return
        end

        -- SetUnit rebuilds the tooltip without Blizzard's appended hint and spacer.
        -- Unit tooltip callbacks, including PTR feedback, run again during the rebuild.
        if tooltip:SetUnit(frame.unit, frame.hideStatusOnTooltip) then
            tooltip:Show()
        end
    end)
end
