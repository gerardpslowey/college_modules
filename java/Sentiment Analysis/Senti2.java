import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

public class Senti2
{
	public static void main(String [] args) throws FileNotFoundException
	{
		Scanner in = new Scanner(new File(args[1]));
		int countword = 0, countline = 0;
		double rating = 0;
		String keyword = args[0];

/////////////////////////////////////////////////////////////////
		while(in.hasNextLine())
		{
			String string = in.nextLine();
			int score = Integer.parseInt(string.substring(0,1));
			string = string.substring(2);

			if(string.contains(keyword))
			{
				countline++;
				rating += score;

//////////////////////////////////////////////////////////////////
				int index = string.indexOf(keyword);
				while(index >= 0)
				{
					countword++;
					index = string.indexOf(keyword, index + 1);
				}
			}
		}
		if (countword == 0)
		{
			countline = 1;
		}
		System.out.println(keyword + " appears " + countword + " times.");
		System.out.print("The average score of the reviews containing " + keyword + " is ");
		System.out.println(String.format("%.2f", (rating/countline)));
	}
}