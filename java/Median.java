import java.util.*;
import java.io.*;
 
public class Median {
	public static void main(String args[]) {

		// get the file to be read
		System.out.print("Enter a text file to be read:\t");
		Scanner sc = new Scanner(System.in);
		String input = sc.nextLine();
		File input_file = new File(input);
		
		// get the file to file to be written to
		System.out.print("Enter a text file to be written to:\t");
		sc = new Scanner(System.in);
		String output = sc.nextLine();
		

		// will hold numbers read
		float nums[] = new float[5];
		int index = 0;

		try {
			sc = new Scanner(input_file);
			while (sc.hasNextLine()) {
				String line = sc.nextLine();
				float f = Float.parseFloat(line);
				nums[index] = f;
				index++;
			}
		}
		catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		// sort the array
		Arrays.sort(nums);
		
		// output results
		try {
			FileWriter fstream = new FileWriter(output);
			BufferedWriter out = new BufferedWriter(fstream);
			out.write("" + nums[(nums.length / 2) + 1]);
			out.close();
		}
		catch (Exception e) {
			System.err.println("Error: " + e.getMessage());
		}
		
	}
}
