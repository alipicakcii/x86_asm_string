# USAGE

This assembly code emulates some functions of the C standard library `<string.h>` on x86 architecture, as well as for ELF files and the System-V ABI.

| Functions                                                             |
|-----------------------------------------------------------------------|
| **_str_len**  : size_t strlen(const char* str)                       |
| **_mem_cpy**  : void* memcpy(void* dstptr, const void* srcptr, size_t size)  |
| **_mem_set**  : void* memset(void* ptr, int value, size_t size)      |
| **_mem_cmp**  : int memcmp(const void* aptr, const void* bptr, size_t size)  |
| **_mem_move** : void* memmove(void* dstptr, const void* srcptr, size_t size)  |
