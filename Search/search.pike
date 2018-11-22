#!/usr/bin/pike

/*
*
* Created on Mon Nov 19 22:12:01 2018
*
* @author: Roger Truchero
*
*/

#include "binarySearch.pike";
#include "linearSearch.pike";


//Function to generate an array of integers 
array(int) generateArray(int N)
{
	array(int) a = ({});
	write(log() + "Generating array of %d elements.\n", N);
    for(int i = 0; i < N; i++) a += ({i});

    return a;
}

//Function to print the elements of the array
void writeElements(array(int) a)
{
	write(log() + "Printing array of numbers: ");
	foreach(a, int num) write("%d ", num);
	write("\n");
}

//Function that obtains the current string time format to make the log
string log()
{
	return ctime(time()) - "\n" + " => ";
}

//Main program 
int main(int argc, array(string) argv)
{
	int n, x;
	array(int) a;

	if(argc == 3)
	{
		n = (int) argv[1];
		x = (int) argv[2];
		a = generateArray(n);
	}
	else{
		write("Usage: pike search.pike <n_numbers> <n>. Ex: pike search.pike 100 1\n");
		exit(0);
	}

	BinarySearch bs = BinarySearch(x, a);
	bs.binarySearch();

	LinearSearch ls = LinearSearch(x, a);
	ls.linearSearch();
}