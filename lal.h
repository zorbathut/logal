
// all we really need is lua_State
#ifdef __cplusplus
  #include <lua.hpp>
  extern "C" {
#else
  #include <lua.h>
#endif

int luaopen_lal(lua_State *L);

#ifdef __cplusplus
  }
#endif
