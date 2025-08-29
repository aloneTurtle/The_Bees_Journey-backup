-- #textdomain wesnoth-The_Bees_Journey
local _ = wesnoth.textdomain "wesnoth-The_Bees_Journey"
local old_unit_status = wesnoth.interface.game_display.unit_status

function wesnoth.interface.game_display.unit_status()
	local u = wesnoth.interface.get_displayed_unit()
	if not u then return {} end
	local s = old_unit_status()

	if u.status.swelling then
		if u.variables.swelled then
			table.insert(s, { "element", {
				image = "misc/bee_venom.png",
				tooltip = string.format(_[[venom: This unit has been stung by a bee. The venom is preventing the unit from fighting at its peak performance, reducing the unit's damage by one. It will lose %s HP on its next turn unless it can seek a cure to the bee`s venom in a village or from a friendly unit with the 'cures' ability.

Units cannot be killed by a bee`s venom alone. The poison will not reduce it below 1 HP.]], u.variables.swell_penalty)
			} })
		else
			table.insert(s, { "element", {
				image = "misc/bee_venom.png",
				tooltip = string.format(_[[venom: This unit has been stung by a bee. It will lose %s HP on its next turn unless it can seek a cure to the bee`s venom in a village or from a friendly unit with the 'cures' ability. Units cannot be killed by a bee`s venom alone. The poison will not reduce it below 1 HP.]], u.variables.swell_penalty)
			} })
		end
	end
--[[
	if u.status.electric_status then
		table.insert(s, { "element", { image = "misc/balling.png",
			tooltip = _ "This unit will has been surrounded by bees, and will lose @ hitpoints on its next turn."
		} } )
	end ]]--

	return s
end
