
// all we really need is lua_State
#ifdef __cplusplus
  #include <lua.hpp>
#else
  #include <lua.h>
#endif

int luaopen_lgl(lua_State *L);
