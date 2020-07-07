import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;

public class Senti1
{
	public static void main(String [] args) throws FileNotFoundException
	{
		Scanner in = new Scanner(new File(args[1]));
		int count = 0;
		String keyword = args[0];
		while(in.hasNext())
		{
			// Now you can read in a line with Scanner's nextLine() method and you can
			// read in an int with the nextInt() method.
			String string = in.next();
			if(string.contains(keyword))
			{
				count++;
			}
		}
		System.out.println(keyword + " appears " + count + " times.");
	}
}