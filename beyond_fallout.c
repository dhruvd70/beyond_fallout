#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

#include "parse_exec/parse_exec.h"


static char input[100];

static bool get_input(void)
{
    printf("\n--> ");
    return fgets(input, sizeof input, stdin) != NULL;
}

int main()
{
    printf("\nWELCOME TO BEYOND FALLOUT\n");
    printf("ARE YOU READY TO TAKE ON THE POST APOCALYPTIC WORLD?\n");

    while (parseAndExecute(input) && get_input()) {
        ;
    }
   
    printf("\nBye!\n");
    return 0;
}