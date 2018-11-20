#!/usr/bin/pike

/*
*
* Created on Mon Nov 19 22:12:01 2018
*
* @author: Roger Truchero
*
*/


class GenerateArray{

	int N;
	string filename;

	void create(string f, string n){
		filename = f;
		N = (int) n;
	}

	void writeNums()
	{
		object file = Stdio.File();

		file.open(filename, "cw");
		for(int i = 0; i < N; i++){
			file.write(i + "\n");
		}
		file.close();
	}


}

//Main program 
int main(int argc, array(string) argv)
{
	GenerateArray ga;

	if(argc == 3)
	{
		ga = GenerateArray(argv[1], argv[2]);
	}
	else{
		write("Usage: pike generateArray.pike <output_file> <n_numbers>. Ex: pike generateArray.pike output.txt 100 \n");
		exit(0);
	}

	ga.writeNums();

}