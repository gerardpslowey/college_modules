import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Senti3
{
    public static String score(String words, String reviews) throws FileNotFoundException{
        Scanner in = new Scanner(new File(words));
        double totalScore = 0;
        int countLines = 0;
        
        while(in.hasNextLine())
        {
            String string = in.nextLine();
            int score = Integer.parseInt(string.substring(0,1));
            String [] word = string.substring(2).split(" ");
            
            if(contains(word, reviews))
            {
                countLines ++;
                totalScore = totalScore + score;
            }
        }
        in.close();
        return String.format("%.2f", (totalScore/countLines));
    }
    
    public static boolean contains(String [] word, String reviews){
        for(int i = 0; i < word.length; i++)
        {
            if(word[i].equals(reviews))
            {
                return true;
            }
        }
        return false;
    }
    
    public static void main(String [] args) throws FileNotFoundException
    {
        Scanner sc = new Scanner(new File(args[0]));
        while(sc.hasNext()){
            String word = sc.next();
            String score = score(args[1], word);
            System.out.println("The score of " + word + " is " + score + ".");
        }
    }
}