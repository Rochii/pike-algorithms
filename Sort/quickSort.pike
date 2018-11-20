#!/usr/bin/pike

/*
*
* Created on Mon Nov 19 19:23:21 2018
*
* @author: Roger Truchero
*
*/

class QuickSort{

	int N, RANDOM_LIMIT;
	array(int) a = ({});

	//Constructor
	void create(string n, string random_limit){
		N = (int) n;
		RANDOM_LIMIT = (int) random_limit;
		generateArray();
	}

	//Function that invokes the main quickSort function
	void quickSorting()
	{
		write(log() + "Sorting array of elements.\n");
		quickSort(0, sizeof(a) - 1);
	}

	//Main quickSort function that makes recursive calls
	void quickSort(int left, int right) 
	{ 
	    if (left < right) 
	    { 
	        int p = partition(left, right);
	        quickSort(left, p - 1); 
	        quickSort(p + 1, right); 
	    } 
	}

	// This function takes last element as pivot, places the pivot element at its correct position in sorted array,
	// and places all smaller (smaller than pivot) to left of pivot and all greater elements to right of pivot 
	int partition(int left, int right) 
	{ 
	    int pivot = a[right];   
	    int i = (left - 1);  
	  
	    for (int j = left; j <= right - 1; j++) 
	    {
	        if (a[j] <= pivot) 
	        { 
	            i++;  
	            swap(i, j);
	        } 
	    } 
	    swap(i + 1, right); 
	    return (i + 1); 
	} 

	//Function to swap two elements 
	void swap(int i, int j) 
	{ 
	    int tmp = a[i]; 
	    a[i] = a[j]; 
	    a[j] = tmp; 
	} 

	//Function to generate an array of integers 
	void generateArray()
	{
		write(log() + "Generating elements for array.\n");
	    for(int i = 0; i < N; i++) a += ({random(RANDOM_LIMIT)});
	}

	//Function to print the elements of the array
	void writeElements()
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
} 

//Main program 
int main(int argc, array(string) argv)
{
	QuickSort qs;

	if(argc == 3)
	{
		qs = QuickSort(argv[1], argv[2]);
	}
	else{
		write("Usage: pike quickSort.pike <n_numbers> <random_limit>. Ex: pike quickSort.pike 1000 100\n");
		exit(0);
	}

	//qs.writeElements();
	qs.quickSorting();
	//qs.writeElements();
}