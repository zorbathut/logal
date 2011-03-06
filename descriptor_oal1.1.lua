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

GetSource = {
  {
    func = "alGetSourcef",
    params = {source, enum, output_float},
    enums = {
      nil,
      "GAIN"
    },
  },
  {
    func = "alGetSourcei",
    params = {source, enum, output_enum},
    enums = {
      nil,
      "SOURCE_STATE",
      returntype = "INITIAL PLAYING PAUSED STOPPED",
    },
  },
},

-- This is where IsExtensionPresent/GetProcAddress/GetEnumValue live, but we're not bothering.

Listener = {
  {
    func = "alListenerf",
    params = {enum, float},
    enums = {"GAIN"},
  },
  {
    func = "alListenerfv",
    params = {enum, table_fixed("float", 3)},
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

Source = {
  {
    func = "alSourcei",
    params = {source, enum, int_or_enum},
    enums = {
      nil,
      "SOURCE_RELATIVE SOURCE_TYPE LOOPING BUFFER BUFFERS_QUEUED BUFFERS_PROCESSED SAMPLE_OFFSET BYTE_OFFSET EXT_MIXER_OVERRIDE_FLAG",
      "TRUE FALSE",
    }
  },
  {
    func = "alSourcef",
    params = {source, enum, float},
    enums = {
      nil,
      "REFERENCE_DISTANCE ROLLOFF_FACTOR MAX_DISTANCE PITCH CONE_INNER_ANGLE CONE_OUTER_ANGLE CONE_OUTER_GAIN SEC_OFFSET GAIN",
      nil,
    }
  },
  {
    func = "alSourcefv",
    params = {source, enum, table_fixed("float", 3)},
    enums = {
      nil,
      "POSITION VELOCITY",
      nil,
    }
  },
  {
    func = "alSourcefv",
    params = {source, enum, table_fixed("float", 2)},
    enums = {
      nil,
      "EXT_MIXER_OVERRIDE",
      nil,
    }
  }
},

SourcePlay = {
  params = {source},
},
SourcePlayv = { -- at some point this should be collapsed back into sourceplay
  func = "alSourcePlayv",
  params = {table("uint")},
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
    -- 0
    NONE = true,
    FALSE = true,
  }
}
