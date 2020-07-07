public class WordScore
{
    String word;
    int score;
    
    public WordScore(String w)
    {
        word = w;
    }
    
    public int score(String review)
    {
        String[] arrayString = review.split(" ");
        
        for(int i = 0; i < arrayString.length; i++)
        {
            if(arrayString[i].equals(this.word))
            {
                return Integer.parseInt(review.substring(1,2));
            }
        }
    return -1;
    }
}