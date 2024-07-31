# USAGE

This assembly code emulates some functions of the C standard library `<string.h>` on x86 architecture, as well as for ELF files and the System-V ABI.

| Functions                                                             |
|-----------------------------------------------------------------------|
| **_str_len**  : size_t  _str_len(const char* str)                       |
| **_mem_cpy**  : void*   _mem_cpy(void* dstptr, const void* srcptr, size_t size)  |
| **_mem_set**  : void*   _mem_set(void* ptr, int value, size_t size)      |
| **_mem_cmp**  : int     _mem_cmp(const void* aptr, const void* bptr, size_t size)  |
| **_mem_move** : void*  _mem_move(void* dstptr, const void* srcptr, size_t size)  |
