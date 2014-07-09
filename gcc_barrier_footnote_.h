#define BARRIER_LOCK() {} {                    \ 
  asm volatile("dsb\n" "isb\n" ::: "memory");  \
}

#define BARRIER_UNLOCK() {} {    	           \ 
  asm volatile(::: "memory");                  \
}

#define BARRIER_LOCK() {} { asm volatile("dsb\n" "isb\n" ::: "memory"); }
#define BARRIER_UNLOCK() {} { asm volatile(::: "memory"); }