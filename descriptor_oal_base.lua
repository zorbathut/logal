local params = ...
local types = params.types

assert(loadfile("descriptor_base.lua"))(types, "AL")

types.buffer = types.int
types.source = types.int
