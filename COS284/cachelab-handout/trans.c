//made by Daniel Grube and Yage Jin
//dgrube & yjin

/* 
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. 
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
	if(M==32 && N==32){
		int row, col, i, j, tmp, temp, diag;
		for(row = 0; row < 4; row++){
			for(col = 0; col < 4; col++){
				for(i = 0; i < 8; i++){
					for(j = 0; j < 8; j++){
						if (row*8+i != col*8+j) {
							tmp = A[row*8+i][col*8+j];
							B[col*8+j][row*8+i] = tmp;
						} else {
							temp = A[row*8+i][col*8+j];
							diag = row*8+i;
						}
					}
					if (row == col) {
						B[diag][diag] = temp;
					}
				}
			}
		}
	}else if(M==64 && N==64){
		int row, col, i, j, tmp, temp, diag;
		for(row = 0; row < 16; row++){
			for(col = 0; col < 16; col++){
				for(i = 0; i < 4; i++){
					for(j = 0; j < 4; j++){
						if (row*4+i != col*4+j) {
							tmp = A[row*4+i][col*4+j];
							B[col*4+j][row*4+i] = tmp;
						} else {
							temp = A[row*4+i][col*4+j];
							diag = row*4+i;
						}
					}
					if (row == col) {
						B[diag][diag] = temp;
					}
				}
			}
		}
	}else{
		int row, col, i, j, tmp, temp, diag;
		for(row = 0; row < 17; row++){
			for(col = 0; col < 16; col++){
				for(i = 0; i < 4; i++){
					if((row*4+i)<67){
						for(j = 0; j < 4; j++){
							if((col*4+j)<61){
								if (row*4+i != col*4+j) {
									tmp = A[row*4+i][col*4+j];
									B[col*4+j][row*4+i] = tmp;
								} else {
									temp = A[row*4+i][col*4+j];
									diag = row*4+i;
								}
							}
						}
						if (row == col) {
							B[diag][diag] = temp;
						}
					}
				}
			}
		}
	}
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
/*	if(M==32 && N==32){
		int row, col, i, j, tmp;
		for(row = 0; row < 4; row++){
			for(col = 0; col < 4; col++){
				for(i = 0; i < 8; i++){
					for(j = 0; j < 8; j++){
						tmp = A[row*8+i][col*8+j];
						B[col*8+j][row*8+i] = tmp;
					}
				}
			}
		}
	}else if(M==64 && N==64){
		int row, col, i, j, tmp;
		for(row = 0; row < 16; row++){
			for(col = 0; col < 16; col++){
				for(i = 0; i < 4; i++){
					for(j = 0; j < 4; j++){
						tmp = A[row*4+i][col*4+j];
						B[col*4+j][row*4+i] = tmp;
					}
				}
			}
		}
	}else{
		int row, col, i, j, tmp;
		for(row = 0; row < 15; row++){
			for(col = 0; col < 16; col++){
				for(i = 0; i < 4; i++){
					if((row*16+i)<67){
						for(j = 0; j < 4; j++){
							if((col*15+i)<61){	
								tmp = A[row*15+i][col*15+j];
								B[col*16+j][row*16+i] = tmp;
							}
						}
					}
				}
			}
		}
	}*/
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc); 

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

