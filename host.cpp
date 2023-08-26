#include <stdio.h>
#include <stdlib.h>

#define IMG 8
int image[IMG];

extern "C" 
{
void fill_image()
{
    FILE *file = fopen("numbers.txt", "r");
    
    if (file == NULL) {
        printf("\n Error opening the file \n");
    }
    int num;
    int index=0;
    while (fscanf(file, "%d", &num) != EOF) {
    	image[index] = num;
	index++;
    }
    fclose(file);
}
int load_data(int r_c)
{
	int val = image[r_c];
	//printf("\n %d %d ", val, r_c);
	return image[r_c];
}
}

int main()
{
	return 0;
}
