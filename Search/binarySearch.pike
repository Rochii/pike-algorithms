#!/usr/bin/pike

/*
*
* Created on Mon Nov 19 16:04:30 2018
*
* @author: Roger Truchero
*
*/

class BinarySearch{

	int N, x;
	array(int) a = ({});

	//Constructor
	void create(string n, string a){
		N = (int) n;
		x = (int) a;
		a += x;
		generateArray();
	}

	//Function that invokes the binarySearch function
	int binarySearching()
	{
	   	write(log() + "Searching element %d in an array of %d elements.\n", x, sizeof(a));
	   	int result = binarySearch(0, sizeof(a) - 1, x); 
	   	if(result == -1)
	   		write(log() + "Element is not present in array.\n");
	   	else
	   		write(log() + "Element %d is present at index %d.\n", a[result], result);
	}

	//Main binarySearch function that uses a divide-and-conquer strategy to find a number x
	int binarySearch(int left, int right, int x) 
	{ 
	    if (right >= left)
	    {
	    	int mid = left + (right - left) / 2; 
	  
	        if (a[mid] == x) return mid;
	      
	        if (a[mid] > x) return binarySearch(left, mid - 1, x); 
	     
	        return binarySearch(mid + 1, right, x); 
	   	} 
	   	return -1; 
	} 

	//Function to generate the array of integers to sort and search
	void generateArray()
	{
		write(log() + "Generating elements for array.\n");
	    for(int i = 0; i < N; i++) a += ({i});
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
	BinarySearch bs;

	if(argc == 3)
	{
		bs = BinarySearch(argv[1], argv[2]);
	}
	else{
		write("Usage: pike binarySearch.pike <n_numbers> <n_search>. Ex: pike binarySearch.pike 1000000 1\n");
		exit(0);
	}

	bs.binarySearching();
}