#include "cachelab.h"
#include <getopt.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

const char opt[] = "s:E:b:t";

struct cacheLine {
	unsigned long long tag;
	int timeStamp;
	int valid;
};
struct cacheLine *cache;
// s number of set index bits
// E number of lines per set
// b number of block offset bits
// t number of tag bits
int s,E,b,t = 0;
int hit_count,miss_count,eviction_count = 0;


char *traceFile;
FILE *readTraceFile;
char operation;
unsigned long long address;
int size;


void setUp(int argc, char *argv[]) {
	char cachePara;
	while ((cachePara = getopt(argc, argv, opt)) != -1) {
		switch (cachePara) {
			case 's':
				s = atoi(optarg);
				break;
			case 'E':
				E = atoi(optarg);
				break;
			case 'b':
				b = atoi(optarg);
				
				break;
			case 't':
				traceFile = argv[8];
				break;
			default:
				break;
		}
	}

	
}


void load(unsigned long long address) {
	unsigned long long tag = address >> b;
	int index = E * (tag & ((1 << s) -1));
	int i = ++t;
	int oldest = ++t;
	int empty = -1;

	for (i=0; i<E; i++) {
		if (cache[index+i].valid == 1) {
			if (cache[index+i].tag == tag) {
				cache[index+i].timeStamp = t;
				hit_count++;
				return;
			}
			
			if (cache[index+i].timeStamp < oldest) {
				oldest = cache[index+i].timeStamp;
				empty = i;
			}

		} else {
			empty = i;
			oldest = t;
			break;
		}
	}
	miss_count++;
	if (oldest != t) {
		eviction_count++;
	}
	cache[index+empty].valid = 1;
	cache[index+empty].timeStamp = t;
	cache[index+empty].tag = tag;
}

void store(unsigned long long address) {
	load(address);
}


int main(int argc, char *argv[]) {
	
	setUp(argc, argv);

	readTraceFile = fopen (traceFile, "r");
	
	cache = (struct cacheLine*)malloc(sizeof(struct cacheLine) * E * (1<<s));
	memset(cache, 0, sizeof(struct cacheLine) * E * (1<<s));

	if (readTraceFile != NULL) {
		while (fscanf (readTraceFile, " %c %llx, %d", &operation, &address, &size) == 3) {
			switch (operation) {
				case 'I': 
					break;
				case 'L':
					load(address);
					break;
				case 'S':
					store(address);
					break;
				case 'M':
					load(address);
					store(address);
					break;
			}
		}

	}

 
    printSummary(hit_count, miss_count, eviction_count);
    return 0;
}

