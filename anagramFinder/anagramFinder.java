/*
 * Anagram Finder
 * by Ivan Galakhov
*/
import java.io.*;
import java.util.*;

public class anagramFinder {
 public static void main(String[] args) throws IOException {
   //the word whos anagram we are trying to find
   String toFind = "horsecart"; //anagram of the word we are trying to find
   String fileName = "words.txt"; //name of file with all the words (relative)
   
   File wordList = new File(fileName);
   
   ArrayList<String> lines = getLines(wordList); //all the words in the test document in an arrayList
   ArrayList<ArrayList<Byte>> wordNums = convertToNums(lines);
   
   }
 //converts all words into their ASCII values - 97
 public static ArrayList<ArrayList<Byte>> convertToNums(ArrayList<String> words){
   ArrayList<ArrayList<Byte>> out = new ArrayList<ArrayList<Byte>>();
   for(int i = 0; i < words.size(); i++){
     String curWord = words.get(i);
     String[] splitChars = curWord.split("");
     ArrayList<Byte> temp = new ArrayList<Byte>();
     for(int j = 0; i < splitChars.length; j++){
       temp.add((byte)((int) splitChars[j].charAt(0)));
     }

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
  } catch (FileNotFoundException e){
    System.out.println(e);
  }
  return out;
 }
}
