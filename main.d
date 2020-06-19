import std.stdio;
import std.file;
import std.path;
import std.algorithm : filter, endsWith;

int main(string[] args)
{
 try
	{
  void printHelp(bool full = false)
		{
			writeln("dfiles tool v0.2 Copyright (C) 2020 by Max Goldaev");
   writeln("Usage: dfiles [-a] <dirName>");
			if(full)
			 writeln("  -a\tShow input arguments");
		}

		if(args.length < 2)
		{
		 printHelp();
			return 1;
		}

		string dname = args[$-1];
		if(args[1] == "--help" || args[1] == "-h")
		{
			printHelp(true);
			return 0;
		}
  if(args[1] == "-a")
		 writeln("Arguments: ", args);


  if(exists(dname) == false)
		{
   writefln("Error!!! Directory [%s] not exists!", dname);
			return 2;
		}
		if(isDir(dname) == false)
		{
   writefln("Error!!! Directory [%s] not a directory!", dname);
			return 2;
		}

  auto iter = dirEntries(dname, SpanMode.depth,true).filter!(f => f.name.endsWith(".d"));
  foreach(DirEntry de; iter)
		 if(de.isFile)
			 stdout.write(relativePath(de.name, dname), " ");
  writeln("");
  stdout.flush();

  return 0;
	}
	catch(Throwable err)
	{
  writeln(err.toString());
		return -1;
	}
}