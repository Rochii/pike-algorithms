#!/usr/bin/pike

/*
*
* Created on Mon Nov 19 19:23:21 2018
*
* @author: Roger Truchero
*
*/

class QuickSort
{
	array(int) a = ({});

	//Constructor
	void create(array(int) arr)
	{
		a = arr;
	}

	//Function that invokes the main quickSort function
	void quickSort()
	{
		write(log() + "Sorting array of elements.\n");
		quickSorting(0, sizeof(a) - 1);
	}

	//Main quickSort function that makes recursive calls
	void quickSorting(int left, int right) 
	{ 
	    if (left < right) 
	    { 
	        int p = partition(left, right);
	        quickSorting(left, p - 1); 
	        quickSorting(p + 1, right); 
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

	//Function that obtains the current string time format to make the log
	string log()
	{
		return ctime(time()) - "\n" + " => ";
	}
}