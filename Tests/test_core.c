#include <assert.h>
#include <string.h>
#include "arijb_core.h"
int main(void) {
    assert(strcmp(arijb_core_status(), "research-scaffold-only") == 0);
    return 0;
}
