#include <stdio.h>
#include "include/api.h"

char dream[128] = {0};

int df_printf_mydream() {
    printf("I have a dream,see: \n%s", dream);
}

int df_build_mydream() {
    sprintf(dream, "\tI am dreaming......\n");
}
