import std.stdio;

int main(string[] args)
{
 try
	{
  writeln(args);


  return 0;
	}
	catch(Throwable err)
	{
  writeln(err.toString());
		return -1;
	}
}