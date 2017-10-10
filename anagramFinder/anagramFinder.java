/*
 * Anagram Finder
 * by Ivan Galakhov
*/
import java.io.*;
import java.util.*;

public class anagramFinder {
  public static int[] primes = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101};
 public static void main(String[] args) throws IOException {
   //the word whos anagram we are trying to find
   String fileName = "words.txt"; //name of file with all the words (relative)
   ArrayList<String> originalWord = new ArrayList<String>();
   originalWord.add(args[0]);
   long toFind = multiplyChars(convertToNums(originalWord))[0]; //prime representation of whatever word we are trying to find
     
   File wordList = new File(fileName);
   
   ArrayList<String> lines = getLines(wordList); //all the words in the test document in an arrayList
   ArrayList<ArrayList<Integer>> wordNums = convertToNums(lines);
   long[] encodedWords = multiplyChars(wordNums);
   
   ArrayList<Integer> found = new ArrayList<Integer>();
   for (int i = 0; i < encodedWords.length; i++){
     if(encodedWords[i] == toFind){
       found.add(i);
     }
   }
   //print out the results
   System.out.println("Found Words:");
   for(int i = 0; i < found.size(); i++){
     System.out.println(lines.get(found.get(i)));
   }
   }
 //converts all words into their ASCII values - 97
 public static long[] multiplyChars(ArrayList<ArrayList<Integer>> words){
   long[] out = new long[words.size()];
   for (int i = 0; i < words.size(); i++){
    ArrayList<Integer> curWord = words.get(i);
    long product = 1;
    for(int j = 0; j < curWord.size(); j++){
     product *= primes[curWord.get(j)]; 
    }
    out[i] = product;
   }
   return out;
 }
 public static ArrayList<ArrayList<Integer>> convertToNums(ArrayList<String> words){
   ArrayList<ArrayList<Integer>> out = new ArrayList<ArrayList<Integer>>();
   for(int i = 0; i < words.size(); i++){
     String curWord = words.get(i);
     ArrayList<Integer> tempChars = new ArrayList<Integer>();
     for(int j = 0; j < curWord.length(); j++){
      Character curChar = curWord.charAt(j);
      int curAscii = (int) curChar;
      if(curAscii >= 97 && curAscii <= 122){
        tempChars.add((curAscii - 97));
      }  
     }
     out.add(tempChars);
   }
   return out;
 }
 
 //returns an arrayList of all words
 public static ArrayList<String> getLines(File wordFile) throws IOException{
   ArrayList<String> out = new ArrayList<String>();
  try {
    Reader rd = new InputStreamReader(new FileInputStream(wordFile));
    BufferedReader in = new BufferedReader(rd);
    
    String curLine;
    
    while ((curLine = in.readLine()) != null){
      out.add(curLine);
    }
    in.close();
  } catch (FileNotFoundException e){
    System.out.println(e);
  }
  return out;
 }
}
