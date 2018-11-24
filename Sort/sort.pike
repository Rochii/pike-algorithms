#!/usr/bin/pike

/*
*
* Created on Mon Nov 19 22:12:01 2018
*
* @author: Roger Truchero
*
*/

#include "quickSort.pike";


//Function to generate a random array of integers 
array(int) generateArray(int n, int random_limit)
{
	array(int) a = ({});
	write(log() + "Generating array of %d elements.\n", n);
    for(int i = 0; i < n; i++) a += ({random(random_limit)});

    return a;
}

//Function to print the elements of the array
void writeElements(array(int) a)
{
	write(log() + "Printing array of numbers: [");
	foreach(a, int num) write(" %d ", num);
	write("]\n");
}

//Function that obtains the current string time format to make the log
string log()
{
	return ctime(time()) - "\n" + " => ";
}

//Main program 
int main(int argc, array(string) argv)
{
	int n, random_limit;
	array(int) a;

	if(argc == 3)
	{
		n = (int) argv[1];
		random_limit = (int) argv[2];
		a = generateArray(n, random_limit);
	}
	else{
		write("Usage: pike sort.pike <n_numbers> <random_limit>. Ex: pike sort.pike 100 100\n");
		exit(0);
	}

	writeElements(a);
	QuickSort qs = QuickSort(a);
	qs.quickSort();
	writeElements(a);
}