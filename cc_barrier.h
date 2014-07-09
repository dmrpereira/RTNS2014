#define BARRIER_LOCK 	{                          \ 
  __builtin_barrier_dsb();                         \
  __builtin_barrier_isb();                         \
 }
 
#define BARRIER_UNLOCK {                           \
  __builtin_barrier(); }                           \
}