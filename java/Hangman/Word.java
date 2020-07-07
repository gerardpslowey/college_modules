public class Word
{
    // returns true if al the letters of the word have been guessed
    public static boolean allDone(String word, String guesses)
    {
        for(int i=0; i<word.length(); i++)
        {
            boolean correct = containsLetter(guesses, word.charAt(i));
            if(correct == false)
                return false;
        }
    return true;
    }

    public static boolean containsLetter(String word, char letter)
    {
        boolean found = false;
        for(int i=0; i<word.length(); i++)
        {
            if(word.charAt(i)==letter)
            {
                found = true;
                break;
            }
        }
    return found;
    }
  
    public static String showLetters(String word, String guess)
    {
        String newStr = "";
        Boolean check = false;
        for(int i = 0;i < word.length();i++)
        {
            for(int j = 0; j < guess.length();j++)
            {
                if(word.charAt(i) == guess.charAt(j))
                    check = true;
            }
        
        if(check)
            newStr = newStr + word.charAt(i);
        else
            newStr = newStr + "_";
        
        check = false;
        }
    return newStr;
    }

    public static String getRandomWord()
    {
      // Start with an array of words ... if you want more words, simply add to this list.
      String [] words = {
            "funny",
            "money",
            "stylish",
            "show",
            "toy",
            "code",
            "computer",
            "int",
            "teddy",
            "while",
            };

      // Choose one of these words randomly ...
      // ... Need a random index between 0 and words.length
      int randomIndex = (int) (Math.random() * words.length);

      // Use the index to return one of these words.
      return words[randomIndex];
    }
}