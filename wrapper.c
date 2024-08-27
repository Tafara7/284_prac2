
#include <stdio.h>
#include <stdlib.h> 


float call_strtof(const char *str) {
    if (str == NULL) {
        fprintf(stderr, "Error: NULL pointer passed to call_strtof\n");
        return 0.0f; 
    }
    return strtof(str, NULL);
}