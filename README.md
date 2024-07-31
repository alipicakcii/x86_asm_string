# USAGE

The assembly functions in `asm_string.asm` emulate some functions of the C standard library `<string.h>` for an x86 system. They are written to support ELF and System-V ABI. The emulated functions are listed below and can be called directly from C/C++ (in C/C++ code compiled for x86).

| Functions                                                             |
|-----------------------------------------------------------------------|
| **_str_len**  : size_t  _str_len(const char* str)                       |
| **_mem_cpy**  : void*   _mem_cpy(void* dstptr, const void* srcptr, size_t size)  |
| **_mem_set**  : void*   _mem_set(void* ptr, int value, size_t size)      |
| **_mem_cmp**  : int     _mem_cmp(const void* aptr, const void* bptr, size_t size)  |
| **_mem_move** : void*  _mem_move(void* dstptr, const void* srcptr, size_t size)  |
