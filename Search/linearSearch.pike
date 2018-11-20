#!/usr/bin/pike

/*
*
* Created on Mon Nov 19 21:42:01 2018
*
* @author: Roger Truchero
*
*/

class LinearSearch{

	int x;
	string filename;
	array(int) a = ({});

	//Constructor
	void create(string input, string num, ){
		filename = input;
		x = (int) num;
		readFile();
	}

	//Function that invokes the linearSearch function
	int linearSearch()
	{
		int result = -1;
	   	write(log() + "Searching element %d in an array of %d elements.\n", x, sizeof(a));
	   	for(int i = 0; i < sizeof(a); i++)
	   	{
	   		if(a[i] == x){
	   			result = i;
	   			break;
	   		}
	   	}

	   	if(result == -1)
	   		write(log() + "Element is not present in array.\n");
	   	else
	   		write(log() + "Element %d is present at index %d.\n", a[result], result);
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
	LinearSearch ls;

	if(argc == 3)
	{
		ls = LinearSearch(argv[1], argv[2]);
	}
	else{
		write("Usage: pike linearSearch.pike <input_file> <n_search>. Ex: pike linearSearch.pike output.txt 1\n");
		exit(0);
	}

	//ls.writeElements();
	ls.linearSearch();
}