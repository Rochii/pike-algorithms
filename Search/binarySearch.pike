#!/usr/bin/pike

/*
*
* Created on Mon Nov 19 16:04:30 2018
*
* @author: Roger Truchero
*
*/

class BinarySearch{

	int x;
	string filename;
	array(int) a = ({});

	//Constructor
	void create(string input, string num, ){
		filename = input;
		x = (int) num;
		readFile();
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

	//Function to generate an array of integers 
	void readFile()
	{
		write(log() + "Reading elements of file %s.\n", filename);
		string s = Stdio.read_file(filename);
		array(string) aux = s / "\n";

		for(int i = 0; i < sizeof(aux) - 1; i++){
			a += ({(int) aux[i]});
		}	
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
		write("Usage: pike binarySearch.pike <input_file> <n_search>. Ex: pike binarySearch.pike output.txt 1\n");
		exit(0);
	}

	//bs.writeElements();
	bs.binarySearching();

}