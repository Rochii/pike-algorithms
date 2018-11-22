#!/usr/bin/pike

/*
*
* Created on Mon Nov 19 21:42:01 2018
*
* @author: Roger Truchero
*
*/

class LinearSearch
{
	int x;
	array(int) a = ({});

	//Constructor
	void create(int num, array(int) arr){
		x = num;
		a = arr;
	}

	//Function that invokes the linearSearch function
	int linearSearch()
	{
		int result = -1;
	   	write("\n" + log() + "Starting linear search of element %d in an array of %d elements.\n", x, sizeof(a));
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

	//Function that obtains the current string time format to make the log
	string log()
	{
		return ctime(time()) - "\n" + " => ";
	}
} 