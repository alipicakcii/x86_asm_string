
;  Copyright (c)  Ali PİÇAKCI. All rights reserved.
;  aapck0@gmail.com
 
global _str_len
global _mem_cpy 
global _mem_cmp
global _mem_move 
global _mem_set
section .data
        

section .text
 ; <string.h>  size_t strlen(const char* str)
_str_len:
                push ecx
                push ebx 
                push ebp 
                mov ebp, esp
                mov eax, [ebp + 16]
                mov ecx, 0
.str_len_loop:
                mov ebx, 0x0
                mov bl,byte  [eax]
                cmp bl, 0 
                je  .str_len_f 
                add ecx, 1
                add eax, 1
                jmp .str_len_loop 

.str_len_f:
                mov eax, ecx
                pop ebp 
                pop ebx 
                pop ecx
                ret

; <string.h> void* memcpy(void*  dstptr, const void*  srcptr, size_t size)
_mem_cpy:
                push ebp
                mov  ebp, esp 
                push edi
                push esi
                push ecx

                mov edi , [ebp + 8 ] ; dest
                mov esi , [ebp + 12] ; src
                cld 
                mov ecx,  [ebp + 16] ; size
                rep movsb 

                mov eax,  [ebp + 8]
                pop ecx
                pop esi
                pop edi
                pop ebp
                ret 

; <string.h> int memcmp(const void* aptr, const void* bptr, size_t size)
_mem_cmp:
                push   ebp
                mov    ebp, esp
                push   ebx 
                push   ecx 
                push   edx
                push   edi 


                mov edi, 0
                mov edx, 0

                mov eax, [ebp + 8]   ; dest
                mov ecx, [ebp + 12]  ; src
                mov ebx, [ebp + 16]  ; size  
.mem_cmp_loop:
                cmp ebx,  0
                je .mem_cmp_end 

                mov dl, byte  [eax]
                cmp dl, byte  [ecx]
                jb .mem_cmp_je_a 

                mov dl, byte  [ecx]
                cmp dl, byte  [eax]
                jb .mem_cmp_je_b 

                add eax, 1
                add ecx, 1
                add ebx, -1
                jmp .mem_cmp_loop 
.mem_cmp_je_a:
                mov eax, -1
                jmp .mem_cmp_fin 
.mem_cmp_je_b:
                mov eax, 1
                jmp .mem_cmp_fin 
.mem_cmp_end:
                mov eax, 0
.mem_cmp_fin:
                pop edi 
                pop edx 
                pop ecx 
                pop ebx 
                pop ebp 
                ret

; <string.h> void* memmove(void* dstptr, const void* srcptr, size_t size)
_mem_move:
                push ebp
                mov  ebp, esp
                push ebx 
                push ecx 
                push esi 
                push edi 
                push edx 

                mov eax, [ebp + 8 ] ; destptr
                mov ebx, [ebp + 12] ; scrptr
                mov ecx, [ebp + 16] ; size

                cmp eax, ebx
                jb ._mem_move_je_a
._mem_move_loop: 
                cmp ecx, 0
                je ._mem_move_fin  
                mov eax, [ebp + 8]
                mov ebx, [ebp + 12]
                add eax, ecx
                add ebx, ecx
                add eax, -1
                add ebx, -1
                mov dl, byte  [ebx]
                mov byte [eax], dl 
                add ecx, -1
                jmp ._mem_move_loop 
._mem_move_je_a:
                mov esi, ebx
                mov edi, eax
                cld
                rep movsb 

._mem_move_fin: 
                mov eax, [ebp + 8]
                pop edx 
                pop edi
                pop esi 
                pop ecx 
                pop ebx 
                pop ebp
                ret 

; <string.h> void* memset(void* bufptr, int value, size_t size) 
_mem_set:
                push ebp
                mov  ebp, esp
                push ecx
                push ebx 

                mov ebx, 0

                mov eax,      [ebp + 8]  ; buffer
                mov bl,  byte [ebp + 12] ; value 
                mov ecx,      [ebp + 16] ; size
._mem_set_loop:
                cmp ecx, 0
                je .mem_set_fin 
                mov byte [eax], bl
                add eax, 1
                add ecx, -1
                jmp ._mem_set_loop 

.mem_set_fin:
                mov eax, [ebp + 8]
                pop ebx 
                pop ecx 
                pop ebp
                ret 
