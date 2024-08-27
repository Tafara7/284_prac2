#include <stdio.h>
#include <stdlib.h>

extern float convertStringToFloat(const char *str);
extern float* extractAndConvertFloats(int *numFloats);
extern double processArray(float *arr, int size);
extern float call_strtof(const char* str);

int main() {

     const char *testStr = "32.133";
    float result = convertStringToFloat(testStr);
    printf("Test String: %s\n", testStr);
    printf("Converted Float: %f\n", result);

    // Test strtof directly
    const char *str = "32.133";
    float value = strtof(str, NULL);
    printf("Test String: %s\n", str);
    printf("Converted Float: %f\n", value); 

    // int numFloats;
    // float *floats = extractAndConvertFloats(&numFloats);

    // if (floats != NULL) {
    //     printf("Converted numbers:\n");
    //     for (int i = 0; i < numFloats; i++) {
    //         printf("%f\n", floats[i]);
    //     }

    //     double sum = processArray(floats, numFloats);
    //     printf("The sum of the processed array is: %f\n", sum);

    //     free(floats);
    // }

    return 0;
}

/** Console input: `| 32.133 45.66 -21.255 |`'s expected output: 

Enter values separated by whitespace and enclosed in pipes (|):
| 32.133 45.66 -21.255 |
Converted numbers:
32.132999
45.660000
-21.254999
The sum of the processed array is: 475.434491

*/