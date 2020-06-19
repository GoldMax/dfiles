import std.stdio;

int main(string[] args)
{
 try
	{
		if(args.length != 2)
		{
   writeln("Usage: dfiles dirName");
			return 1;
		}


 writeln(args);

  return 0;



	}
	catch(Throwable err)
	{
  writeln(err.toString());
		return -1;
	}
}