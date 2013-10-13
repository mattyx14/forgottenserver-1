local holeId = {294, 369, 370, 383, 392, 408, 409, 410, 427, 428, 430, 462, 469, 470, 482, 484, 485, 489, 924, 3135, 3136}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if toPosition.x == CONTAINER_POSITION or (toPosition.x == 0 and toPosition.y == 0 and toPosition.z == 0) then
		return false
	end

	local groundTile = getThingfromPos(toPosition)
	if isInArray(ropeSpots, groundTile.itemid) then
		doTeleportThing(cid, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1}, FALSE)
		return true
	elseif isInArray(holeId, itemEx.itemid) then
		local thing = getThingfromPos({x = toPosition.x, y = toPosition.y, z = toPosition.z + 1, stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE})
		if thing.uid > 0 then
			toPosition.y = toPosition.y + 1
			doTeleportThing(thing.uid, toPosition)
			return true
		end
	end
	return false
end
