minetest.register_chatcommand("speed",{
   privs = {
      fast = true},
      func = function(name, param) 
      local player = minetest.get_player_by_name(name)
      local playerspeed = player:get_physics_override().speed
      local fast = (playerspeed * 3.6)
      minetest.get_player_by_name(name):set_physics_override({speed=fast})
      local privs = minetest.get_player_privs(name) privs.fast = nil minetest.set_player_privs(name, privs)end})


minetest.register_chatcommand("unspeed",{
   privs = {
      interact = true 
      },
      func = function(name, param) 
      local player = minetest.get_player_by_name(name)
      local playerspeed = player:get_physics_override().speed
      local fastcheck = minetest.check_player_privs(name, {fast=true})
      if fastcheck then minetest.chat_send_player(name,"you already have fast priv") else
      local fast = (playerspeed / 3.6)
      minetest.get_player_by_name(name):set_physics_override({speed=fast})
      local privs = minetest.get_player_privs(name) privs.fast = true minetest.set_player_privs(name, privs)end end})