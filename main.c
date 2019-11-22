#include <stdio.h>
#include "libbuild/include/api.h"
#include "libstatic/include/api.h"
#include "dream_first/include/api.h"

int main(int argc, char** argv) {
#ifdef DEBUG
    printf("DEBUG:begin\n");
#else
    printf("begin\n");
#endif
    my_printf();
    sl_printf();
    df_build_mydream();
    df_printf_mydream();
#ifdef DEBUG
    printf("DEBUG:end\n");
#else
    printf("end\n");
#endif
}
