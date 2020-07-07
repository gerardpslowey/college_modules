// Write your Hangman class here
import java.util.Scanner;

public class Hangman
{
	public static void main(String [] args)
	{
		Scanner in = new Scanner(System.in);
		
		// First get the word
		String word = Word.getRandomWord();

		String newStr = "";
		for(int i = 0; i < word.length(); i++)
		{
			newStr += "_";
		}

		// Now you have the word ... encourage the user to guess.
		System.out.print("The word is ");
		System.out.println(newStr);
		
		int guess_count = newStr.length() * 2;
		String guesses = "";
		boolean finished = Word.allDone(word, newStr);
		while(finished != true)
		{
			// check if all guesses used up
			if(guess_count == 0)
				break;

			System.out.println("You have " + guess_count + " guesses remaining.");
			System.out.println("Guess a letter:");
			guesses += in.next();
			guess_count -= 1;
			newStr = Word.showLetters(word, guesses);
			System.out.println(newStr);
			finished = Word.allDone(word, newStr);
		}
	if(finished)
		System.out.println("Well Done, the word was " + newStr + ".");
	else
		System.out.println("Hard luck, too many guesses");
	}
}