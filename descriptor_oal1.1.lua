data = {

-- In order in the al.h file

--[[Enable = {
  params = {enum},
  enums = {""},
},
Disable = {
  params = {enum},
  enums = {""},
},
IsEnabled = {
  params = {enum},
  enums = {""},
  returntype = boolean,
},]] -- no valid possibilities

Get = {
  {
    func = "alGetFloat",
    params = {enum},
    enums = {"DOPPLER_FACTOR SPEED_OF_SOUND"},
    returntype = float,
  },
  {
    func = "alGetInteger",
    params = {enum},
    enums = {"DISTANCE_MODEL", returntype = "NONE INVERSE_DISTANCE INVERSE_DISTANCE_CLAMPED LINEAR_DISTANCE LINEAR_DISTANCE_CLAMPED EXPONENT_DISTANCE EXPONENT_DISTANCE_CLAMPED"},
    returntype = enum,
  },
  {
    func = "alGetString",
    params = {enum},
    enums = {"VERSION RENDERER VENDOR EXTENSIONS"},
    returntype = string,
  }
},

GetError = {
  params = {},
  enums = {returntype = "NO_ERROR INVALID_NAME INVALID_ENUM INVALID_VALUE INVALID_OPERATION OUT_OF_MEMORY"},
  returntype = enum,
},

-- This is where IsExtensionPresent/GetProcAddress/GetEnumValue live, but we're not bothering.

Listener = {
  {
    func = "alListenerf",
    params = {enum, float},
    enums = {"GAIN"},
  },
  {
    func = "alListener3f",
    params = {enum, float, float, float},
    enums = {"POSITION VELOCITY"},
  },
  -- missing ORIENTATION
},
-- missing GetListener

GenSources = {
  params = {int, output_table("ALuint", "param1")},
},
DeleteSources = {
  params = {table("uint")},
},

SourcePlay = {
  params = {source},
},
SourceStop = {
  params = {source},
},
SourceRewind = {
  params = {source},
},
SourcePause = {
  params = {source},
},

SourceQueueBuffers = {
  params = {source, table("uint")}
},
SourceUnqueueBuffers = {
  params = {source, table("uint")}
},

GenBuffers = {
  params = {int, output_table("ALuint", "param1")},
},
DeleteBuffers = {
  params = {table("uint")},
},
IsBuffer = {
  params = {buffer},
},
-- missing BufferData

--[[Buffer = {
  params = {enum},
  enums = {""}, 
},]]  -- no valid possibilities
GetBuffer = {
  params = {enum, int, output_int},
  enums = {"FREQUENCY SIZE BITS CHANNELS"},
  func = "alGetBufferi",
},

DopplerFactor = {
  params = {float},
},
-- DopplerVelocity intentionally omitted, it's not needed in 1.1
SpeedOfSound = {
  params = {float},
},
DistanceModel = {
  params = {enum},
  enums = {"NONE INVERSE_DISTANCE INVERSE_DISTANCE_CLAMPED LINEAR_DISTANCE LINEAR_DISTANCE_CLAMPED EXPONENT_DISTANCE EXPONENT_DISTANCE_CLAMPED"},
},

}

options = {
  asymmetric = {
  }
}
