import java.util.Random;

public class CageSimulator {
	public static void main(String args[]) {
		create_Groupings_for_Cage();
	}
	public static void indexToArray(int index) {
		int row = index / 6;
		int column = index % 6;
		System.out.println("[" + row + " , " + column + "]\n");
	}
	public static void arrayToIndex(int row, int column) {
		int index = (row * 6) + column;
		System.out.println("index: " + index + "\n");
	}
	public static void pureToReal(int row, int column) {
		
	}
	public static void printNumbers (int numbers[]) {
		int i;
		//NSLog(@"Numbers[]:");
		System.out.println("Numbers[]: ");
		for (i = 0; i < numbers.length; i++) {
			//System.out.print("*" + (i%5) + " ");
			if (i == 0)
				System.out.print(numbers[i] + " ");
			else if ((i+1) % 6 == 0) {
				System.out.print(numbers[i] + "\n");
				//printf("%i ", a[i]);
			}
			else
				System.out.print(numbers[i] + " ");
		}
		//NSLog(@" ");
	}
	public static void printArray(int array[][]) {
		int i;
		int j;
		//NSLog(@"Array[]:");
		System.out.println("Array[][]: ");
		for (i = 0; i < array.length; i++) {
			for (j = 0; j < array.length; j++) {
				//printf("%i ", a[i][j]);
				System.out.print(array[i][j] + " ");
			}
			//NSLog(@" ");
			System.out.println();
		}
		//NSLog(@" ");
		System.out.println();
	}
	public static int convertIndexes(int index) {
		int real_index = 0;
		if (index >= 7 && index <= 10)	// index falls within [7, 10]
			real_index = index - 7;	
		else if (index >= 13 && index <= 16)
			real_index = index - 9;
		else if (index >= 19 && index <= 22)
			real_index = index - 11;
		else if (index >= 25 && index <= 28)
			real_index = index - 13;
		return real_index;
	}
	public static void create_Groupings_for_Cage() {
	/*	int array[] = new int[16];
		for (i = 0; i < array.length; i++)
			array[i] = 0;
		for (i = 0; i <= 15; i++) {
			random = randomGenerator.nextInt(2);
			index = randomGenerator.nextInt(16);
			while (array[index] != 0)
				index = randomGenerator.nextInt(16);
			array[index] = 1;
			if (random == 0)
				System.out.println("Cage of 2 for index: " + index + "\n");
			else if (random == 1)
				System.out.println("Cage of 3 for index: " + index + "\n");
		}	*/
	
	
		int i = 0;
		int j = 0;
		int k = 0;
		int random = 0;
		int index = 0;
		int group = 0;
		int counter = 0;
		int real_index1 = 0;
		int real_index2 = 0;
		int real_index3 = 0;
		int pure_index2 = 0;
		int pure_index3 = 0;
	 	
	 	Random randomGenerator = new Random();
		int numbers[] = new int [36];
		int array[][] = new int [6][6];
		Boolean foundNeighbor = false;
		//NSMutableArray* cage_group;
		
		// set numbers array to zero
		for (i = 0; i < 36; i++) {
			numbers[i] = 0;
		}
		printNumbers(numbers);
		
		// set all borders to zero and inside boxes to 1
		for (i = 0; i < 6; i++) {
			for (j = 0; j < 6; j++) {
				if (j == 0)				// left border
					array[i][j] = 0;
				else if (i == 0)		// top border
					array[i][j] = 0;
				else if (j == 5)		// right border
					array[i][j] = 0;	
				else if (i == 5)		// bottom border
					array[i][j] = 0;
				else					// inner boxes
					array[i][j] = 1;
			}
		}
		printArray(array);
		
		// begin cage generating
		for (i = 0; i < 36; i++) {
			foundNeighbor = false;						// security
			random = randomGenerator.nextInt(2);		// random number from [0, 1]
			index = randomGenerator.nextInt(36);		// random number from [0, 35]
			while (numbers[index] != 0)
				index = randomGenerator.nextInt(36);	// random number from [0, 1]
		
			// 1 - number has been used but NOT necessarily grouped yet
			numbers[index] = 1;
			
			System.out.println("index: "+ index);
			// NSLog(@"index chosen: %i", index);
			System.out.println("group: " + (random + 2));
			// NSLog(@"group chosen: %i", (random + 2));
			indexToArray(index);
			//NSLog(@"coordinates: [%i, %i]", (index / 6), (index % 6));
			//NSLog(@" ");
		
			// test to see if the index chosen is out of bounds
			if (array[index / 6][index % 6] == 0) {
				numbers[index] = -1;
				printArray(array);
				continue;
			}
			// if index is chosen to be grouped in a cage of 2
			if (random == 0) {
				//NSLog(@"Cage of 2 for index: %i", index);
				group = 2;
				array[index / 6][index % 6] = group;
				//NSLog(@"index: %i and coordinates: [%i , %i] ", index, (index / 6), (index % 6));
				// increment group counter for that group
				counter = 1;
				
				// test to see if the indexes neighbors are possible group member
				for (k = -1; k <= 1; k+=2) {
					if (array[(index / 6)][(index % 6) + k] == group)	{	// check if left and right neighbors are definite candidates for grouping
						counter++;											// increment group counter for that group
						System.out.println("counter: " + counter);
						// test to see if group can be locked
						if (counter == group && array[(index / 6)][(index % 6) + k] == group) {
							// convert to the proper indexes
							real_index1 = convertIndexes(index);
							real_index2 = convertIndexes((index + k));
							
							System.out.println("index: " + index);
							System.out.println("neighbor: " + (index + k));
							System.out.println("real_index1: " + real_index1);
							System.out.println("real_index2: " + real_index2);
					/*		NSLog(@"index: %i", index);
							NSLog(@"index + i: %i", index + k);
							NSLog(@"real_index1: %i", real_index1);
							NSLog(@"real_index2: %i", real_index2);
					*/							
							// store boxView references in cage groups
							
							System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
							System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
							
							//cage_group = [NSMutableArray arrayWithCapacity: 2];
							//[cage_group addObject: [boxes objectAtIndex: real_index1]];
							//[cage_group addObject: [boxes objectAtIndex: real_index2]];
							//[cages addObject: cage_group];
						
							foundNeighbor = true;
							array[index / 6][index % 6] = 0;	// remove data from array
							array[(index / 6)][(index % 6) + k] = 0;	// remove data from array
							
							System.out.println("Setting [" + (index/6) + " , " + (index%6) + "] to 0");
							System.out.println("Setting [" + (index/6) + " , " + (index%6 + k) + "] to 0");
							
							// 2 - numbers are DONE completely
							numbers[index] = 2;
							numbers[index + k] = 2;
							break;
						}
					}
				}
				if (foundNeighbor == true) {
					foundNeighbor = false;
					printArray(array);
					continue;
				}
				for (k = -1; k <= 1; k+=2) {
					if (array[(index / 6) + k][(index % 6)] == group)	{	// check if top and bottom neighbors are definite candidates for grouping
						counter++;											// increment group counter for that group
						System.out.println("counter: " + counter);
						// test to see if group can be locked
						if (counter == group && array[(index / 6) + k][(index % 6)] == group) {
							// convert to the proper indexes
							real_index1 = convertIndexes(index);
							real_index2 = convertIndexes((index + (6 * k)));
							
						/*	NSLog(@"index: %i", index);
							NSLog(@"index + (6 * i): %i", (index + (6 * k)));
							NSLog(@"real_index1: %i", real_index1);
							NSLog(@"real_index2: %i", real_index2);
						*/
							System.out.println("index: " + index);
							System.out.println("neighbor: " + (index + k));
							System.out.println("real_index1: " + real_index1);
							System.out.println("real_index2: " + real_index2);
							
							// store boxView references in cage groups
						/*	cage_group = [NSMutableArray arrayWithCapacity: 2];
							[cage_group addObject: [boxes objectAtIndex: real_index1]];
							[cage_group addObject: [boxes objectAtIndex: real_index2]];
							[cages addObject: cage_group];
						*/
						
							System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
							System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
							
							foundNeighbor = true;
							array[index / 6][index % 6] = 0;	// remove data from array
							array[(index / 6) + k][(index % 6)] = 0;	// remove data from array
							
							System.out.println("Setting [" + (index/6) + " , " + (index%6) + "] to 0");
							System.out.println("Setting [" + ((index/6) + k) + " , " + (index%6) + "] to 0");
							
							// 2 - numbers are DONE completely
							numbers[index] = 2;
							numbers[(index + (6 * k))] = 2;
							break;
						}
					}
				}	
				
				// if no groupings were made check for other FORCED groupings
				//NSLog(@"TESTING FOR FORCED GROUPS*******************");
				System.out.println("TESTING FOR FORCED GROUPS");
				counter = 1;
    //			NSLog(@"Forced groupings must be checked");
	//			NSLog(@"group = %i", group);
				for (k = -1; k <= 1; k+=2) {
	//				NSLog(@"Checking... index: %i", (index + (6 * k)));
	//				NSLog(@"index: %i has value of %i", (index + (6 * k)), array[(index / 6) + k][(index % 6)]);
					if (array[(index / 6) + k][(index % 6)] > group)	{	// check if top and bottom neighbors are possible candidates for grouping
						counter++;											// increment group counter for that group
						// test to see if group can be locked
						if (counter == group && array[(index / 6) + k][(index % 6)] > group) {
							// convert to the proper indexes
							real_index1 = convertIndexes(index);
							real_index2 = convertIndexes((index + (6 * k)));
							
						//	NSLog(@"index: %i", index);
						//	NSLog(@"index + (6 * i): %i", (index + (6 * k)));
						//	NSLog(@"real_index1: %i", real_index1);
						//	NSLog(@"real_index2: %i", real_index2);
						
							System.out.println("index: " + index);
							System.out.println("neighbor: " + (index + (6*k)));
							System.out.println("real_index1: " + real_index1);
							System.out.println("real_index2: " + real_index2);
						
							// store boxView references in cage groups
						/*	cage_group = [NSMutableArray arrayWithCapacity: 2];
							[cage_group addObject: [boxes objectAtIndex: real_index1]];
							[cage_group addObject: [boxes objectAtIndex: real_index2]];
							[cages addObject: cage_group];
						*/
							System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
							System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
						
							foundNeighbor = true;
							array[index / 6][index % 6] = 0;	// remove data from array
							array[(index / 6) + k][(index % 6)] = 0;	// remove data from array
							
							System.out.println("Setting [" + (index/6) + " , " + (index%6) + "] to 0");
							System.out.println("Setting [" + ((index/6) + k) + " , " + (index%6) + "] to 0");
							
							// 2 - numbers are DONE completely
							numbers[index] = 2;
							numbers[(index + (6 * k))] = 2;
							break;
						}
					}
				}			
				if (foundNeighbor == true) {
					foundNeighbor = false;
					printArray(array);
					continue;
				}
				for (k = -1; k <= 1; k+=2) {
					//System.out.println("Checking... index: " + (index+k));
					//NSLog(@"Checking... index: %i", index + k);
					//System.out.println("index: " + (index+k) + " has a value of " + (array[(index / 6)][(index % 6) + k]));
					//NSLog(@"index: %i has value of %i", index + k, array[(index / 6)][(index % 6) + k]);
					if (array[(index / 6)][(index % 6) + k] > group)	{	// check if left and right neighbors are possible candidates for grouping
						counter++;											// increment group counter for that group
						// test to see if group can be locked
						if (counter == group && array[(index / 6)][(index % 6) + k] > group) {
							// convert to the proper indexes
							real_index1 = convertIndexes(index);
							real_index2 = convertIndexes((index + k));
							
					/*		NSLog(@"index: %i", index);
							NSLog(@"index + i: %i", index + k);
							NSLog(@"real_index1: %i", real_index1);
							NSLog(@"real_index2: %i", real_index2);
					*/
							System.out.println("index: " + index);
							System.out.println("neighbor: " + (index + k));
							System.out.println("real_index1: " + real_index1);
							System.out.println("real_index2: " + real_index2);	
							
							// store boxView references in cage groups
					/*		cage_group = [NSMutableArray arrayWithCapacity: 2];
							[cage_group addObject: [boxes objectAtIndex: real_index1]];
							[cage_group addObject: [boxes objectAtIndex: real_index2]];
							[cages addObject: cage_group];
					*/
					
							System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
							System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
							
							foundNeighbor = true;
							array[index / 6][index % 6] = 0;	// remove data from array
							array[(index / 6)][(index % 6) + k] = 0;	// remove data from array
							
							System.out.println("Setting [" + (index/6) + " , " + (index%6) + "] to 0");
							System.out.println("Setting [" + (index/6) + " , " + ((index%6) + k) + "] to 0");
							
							// 2 - numbers are DONE completely
							numbers[index] = 2;
							numbers[index + k] = 2;
							break;
						}
					}
				}
			}
	
			// else if index is chosen to be grouped in a cage of 3
			else if (random == 1) {
				//NSLog(@"Cage of 3 for index: %i", index);
				group = 3;
				array[index / 6][index % 6] = group;
				//NSLog(@"index: %i and coordinates: [%i , %i] ", index, (index / 6), (index % 6));
				// increment group counter for that group
				counter = 1;
					
				// test to see if the indexes neighbors are possible group member
				for (k = -1; k <= 1; k+=2) {
					if (array[(index / 6)][(index % 6) + k] == group)	{	// check if left and right neighbors are definite candidates for grouping
						counter++;											// increment group counter for that group
						//NSLog(@"counter: %i", counter);
						System.out.println("counter: " + counter);
						// test to see if one possible neighbor is found
						if (counter == (group - 1) && array[(index / 6)][(index % 6) + k] == group) {
							System.out.println("found first neighbor for group of 3");
							//NSLog(@"found first neighbor for group of 3");
							real_index2 = convertIndexes(index + k);
							pure_index2 = index + k;
							System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
							System.out.println("retesting for neighbors of " + pure_index2);
							//NSLog(@"pure_index2: %i", pure_index2);
							//NSLog(@"retesting for neighbors of pure_index2...");
							// now retest for the neighbor we just found left and right
							for (j = -1; j <= 1; j+=2) {
								System.out.println("testing... " + (pure_index2 + j));
								//NSLog(@"testing... pure_index3 at %i", pure_index2 + j);
								if (array[(pure_index2 / 6)][(pure_index2 % 6) + j] == group && ((pure_index2 % 6) + j != index % 6))	{	// check if left and right neighbors are definite candidates for grouping
									System.out.println("Success at this index");
									//NSLog(@"Success at this index");
									counter++;									// increment group counter for that group
									
									real_index3 = convertIndexes(pure_index2 + j);
									pure_index3 = pure_index2 + j;
									System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
									break;
								}
								else {
									//NSLog(@"Fail at this index, retesting");
									System.out.println("Fail at this index.  Retesting");
								}
									
							}
							if (counter == group) {
								// store boxView references in cage groups
								real_index1 = convertIndexes(index);
							/*	cage_group = [NSMutableArray arrayWithCapacity: 3];
								[cage_group addObject: [boxes objectAtIndex: real_index1]];
								[cage_group addObject: [boxes objectAtIndex: real_index2]];
								[cage_group addObject: [boxes objectAtIndex: real_index3]];
								[cages addObject: cage_group];
							*/
							
								System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
								System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
								System.out.println("PLACING BOX WITH INDEX " + real_index3 + "into cage");
							
								foundNeighbor = true;
								System.out.println("Turn the following coordinates to 0");
								System.out.println("[" + (index/6) + " , " + (index%6) + "]");
								System.out.println("[" + (index/6) + " , " + (pure_index2%6) + "]");
								System.out.println("[" + (index/6) + " , " + (pure_index3%6) + "]");
							/*	NSLog(@"Turn the following coordinates to 0");
								NSLog(@"[%i , %i]", (index / 6), (index % 6));
								NSLog(@"[%i , %i]", (index / 6), (pure_index2 % 6));
								NSLog(@"[%i , %i]", (index / 6), (pure_index3 % 6));
							*/	
								array[index / 6][index % 6] = 0;	// remove data from array
								array[(index / 6)][(pure_index2 % 6)] = 0;	// remove data from array
								array[(index / 6)][(pure_index3 % 6)] = 0;	// remove data from array
								
								// 2 - numbers are DONE completely
								numbers[index] = 2;
								numbers[pure_index2] = 2;
								numbers[pure_index3] = 2;
								
								System.out.println("Found completed group");
								System.out.println("pure_index: " + index + " with real_index: " + real_index1);
								System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
								System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
								
							/*	NSLog(@"Found completed group");
								NSLog(@"pure_index1: %i", index);
								NSLog(@"pure_index2: %i", pure_index2);
								NSLog(@"pure_index3: %i", pure_index3);
								NSLog(@"real_index1: %i", real_index1);
								NSLog(@"real_index2: %i", real_index2);
								NSLog(@"real_index3: %i", real_index3);
							*/
								break;
							}
							// retest for the neighbor we just found up and down
							else {
								for (j = -1; j <= 1; j+=2) {
									System.out.println("testing... " + (pure_index2 + (6 * j)));
									//NSLog(@"testing... pure_index3 at %i", pure_index2 + (6 * j));
									if (array[(pure_index2 / 6) + j][(pure_index2 % 6)] == group)	{	// check if top and bottom neighbors are definite candidates for grouping
										System.out.println("Success at this index");
										//NSLog(@"Success at this index");
										counter++;									// increment group counter for that group
										real_index3 = convertIndexes(pure_index2 + (6 * j));
										pure_index3 = pure_index2 + (6 * j);
										System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
										break;
									}
									else {
										//NSLog(@"Fail at this index, retesting");
										System.out.println("Fail at this index,  Retesting");
									}	
								}
								if (counter == group) {
									// store boxView references in cage groups
									real_index1 = convertIndexes(index);
							/*		cage_group = [NSMutableArray arrayWithCapacity: 3];
									[cage_group addObject: [boxes objectAtIndex: real_index1]];
									[cage_group addObject: [boxes objectAtIndex: real_index2]];
									[cage_group addObject: [boxes objectAtIndex: real_index3]];
									[cages addObject: cage_group];
							*/
									System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
									System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
									System.out.println("PLACING BOX WITH INDEX " + real_index3 + "into cage");
							
									foundNeighbor = true;
									array[index / 6][index % 6] = 0;	// remove data from array
									array[(index / 6)][(pure_index2 % 6)] = 0;	// remove data from array
									array[(pure_index3 / 6)][(pure_index2 % 6)] = 0;	// remove data from array
									
									System.out.println("Turn the following coordinates to 0");
									System.out.println("[" + (index/6) + " , " + (index%6) + "]");
									System.out.println("[" + (index/6) + " , " + (pure_index2%6) + "]");
									System.out.println("[" + (pure_index3/6) + " , " + (pure_index2%6) + "]");
									
							/*		NSLog(@"Turn the following coordinates to 0");
									NSLog(@"[%i , %i]", (index / 6), (index % 6));
									NSLog(@"[%i , %i]", (index / 6), (pure_index2 % 6));
									NSLog(@"[%i , %i]", (pure_index3 / 6), (pure_index2 % 6));
							*/		
									// 2 - numbers are DONE completely
									numbers[index] = 2;
									numbers[pure_index2] = 2;
									numbers[pure_index3] = 2;
									
									System.out.println("Found completed group");
									System.out.println("pure_index: " + index + " with real_index: " + real_index1);
									System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
									System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
									
							/*		NSLog(@"Found completed group");
									NSLog(@"pure_index1: %i", index);
									NSLog(@"pure_index2: %i", pure_index2);
									NSLog(@"pure_index3: %i", pure_index3);
									NSLog(@"real_index1: %i", real_index1);
									NSLog(@"real_index2: %i", real_index2);
									NSLog(@"real_index3: %i", real_index3);
							*/
									break;
								}
							}
						}
						// test to see if group can be locked (STILL LEFT AND RIGHT)
						else if (counter == group && array[(index / 6)][(index % 6) + k] == group) {
							System.out.println("counter: " + counter);
							System.out.println("group: " + group);
							
							//NSLog(@"counter: %i", counter);
							//NSLog(@"group: %i", group);
							// convert to the proper indexes
							real_index1 = convertIndexes(index);
							real_index3 = convertIndexes(index + k);
							pure_index3 = (index + k);
							System.out.println("pure_index: " + index + " with real_index: " + real_index1);
							System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
							System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
							
					/*		NSLog(@"index: %i", index);
							NSLog(@"index + i: %i", index + k);
							NSLog(@"index + i: %i", pure_index2);
							NSLog(@"real_index1: %i", real_index1);
							NSLog(@"real_index2: %i", real_index2);
							NSLog(@"real_index3: %i", real_index3);
					*/		
							// store boxView references in cage groups
					/*		cage_group = [NSMutableArray arrayWithCapacity: 3];
							[cage_group addObject: [boxes objectAtIndex: real_index1]];
							[cage_group addObject: [boxes objectAtIndex: real_index2]];
							[cage_group addObject: [boxes objectAtIndex: real_index3]];
							[cages addObject: cage_group];
					*/
							System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
							System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
							System.out.println("PLACING BOX WITH INDEX " + real_index3 + "into cage");
		
							foundNeighbor = true;
							System.out.println("Turn the following coordinates to 0");
							System.out.println("[" + (index/6) + " , " + (index%6) + "]");
							System.out.println("[" + (index/6) + " , " + (pure_index2%6) + "]");
							System.out.println("[" + (index/6) + " , " + (pure_index3%6) + "]");
							
							array[index / 6][index % 6] = 0;	// remove data from array
							array[(index / 6)][pure_index2 % 6] = 0;	// remove data from array
							array[(index / 6)][pure_index3 % 6] = 0;	// remove data from array
							
							// 2 - numbers are DONE completely
							numbers[index] = 2;
							numbers[index + k] = 2;
							numbers[pure_index2] = 2;
						
							System.out.println("Found completed group");
							System.out.println("pure_index: " + index + " with real_index: " + real_index1);
							System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
							System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
							break;
						}
					}
				}
				if (foundNeighbor == true) {
					foundNeighbor = false;
					printArray(array);
					continue;
				}
				for (k = -1; k <= 1; k+=2) {
					if (array[(index / 6) + k][(index % 6)] == group)	{	// check if top and bottom neighbors are definite candidates for grouping
						counter++;	
						System.out.println("counter: " + counter);
						System.out.println("group " + group);				// increment group counter for that group
						//NSLog(@"counter: %i", counter);
						// test to see if one possible neighbor is found
						if (counter == (group - 1) && array[(index / 6) + k][(index % 6)] == group) {
							System.out.println("found first neighbor for group of 3");
							//NSLog(@"found first neighbor for group of 3");
							real_index2 = convertIndexes((index + (6 * k)));
							pure_index2 = (index + (6 * k));
							//NSLog(@"pure_index2: %i", pure_index2);
							//NSLog(@"retesting for neighbors of pure_index2...");
							System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
							// now retest for the neighbor we just found left and right
							
							for (j = -1; j <= 1; j+=2) {
								System.out.println("testing... " + (pure_index2 + j));
								//NSLog(@"testing... pure_index3 at %i", pure_index2 + j);
								if (array[(pure_index2 / 6)][(pure_index2 % 6) + j] == group)	{	// check if left and right neighbors are definite candidates for grouping
									System.out.println("Success at this index");
									//NSLog(@"Success at this index");
									counter++;									// increment group counter for that group
									real_index3 = convertIndexes(pure_index2 + j);
									pure_index3 = pure_index2 + j;
									System.out.println("pure_index " + pure_index3 + " with real_index: " + real_index3);
									break;
								}
								else {
									System.out.println("Fail at this index.  Retesting");
									//NSLog(@"Fail at this index, retesting");
								}
							}
							if (counter == group) {
								// store boxView references in cage groups
								real_index1 = convertIndexes(index);
							/*	cage_group = [NSMutableArray arrayWithCapacity: 3];
								[cage_group addObject: [boxes objectAtIndex: real_index1]];
								[cage_group addObject: [boxes objectAtIndex: real_index2]];
								[cage_group addObject: [boxes objectAtIndex: real_index3]];
								[cages addObject: cage_group];
							*/
								foundNeighbor = true;
								
								System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
								System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
								System.out.println("PLACING BOX WITH INDEX " + real_index3 + "into cage");
								
								System.out.println("Turn the following coordinates to 0");
								System.out.println("[" + (index/6) + " , " + (index%6));
								System.out.println("[" + (pure_index2/6) + " , " + (index%6));
								System.out.println("[" + (pure_index2/6) + " , " + (pure_index3%6));
								
							/*	NSLog(@"Turn the following coordinates to 0");
								NSLog(@"[%i , %i]", (index / 6), (index % 6));
								NSLog(@"[%i , %i]", (index / 6), (pure_index2 % 6));
								NSLog(@"[%i , %i]", (index / 6), (pure_index3 % 6));
							*/		  
								array[index / 6][index % 6] = 0;	// remove data from array
								array[(pure_index2/ 6)][(index % 6)] = 0;	// remove data from array
								array[(pure_index2/ 6)][(pure_index3 % 6)] = 0;	// remove data from array
								
								// 2 - numbers are DONE completely
								numbers[index] = 2;
								numbers[pure_index2] = 2;
								numbers[pure_index3] = 2;
								
							/*	NSLog(@"Found completed group");
								NSLog(@"pure_index1: %i", index);
								NSLog(@"pure_index2: %i", pure_index2);
								NSLog(@"pure_index3: %i", pure_index3);
								NSLog(@"real_index1: %i", real_index1);
								NSLog(@"real_index2: %i", real_index2);
								NSLog(@"real_index3: %i", real_index3);							
							*/
							
								System.out.println("Found completed group");
								System.out.println("pure_index: " + index + " with real_index: " + real_index1);
								System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
								System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
								break;
							}
							// retest for the neighbor we just found up and down
							else {
								for (j = -1; j <= 1; j+=2) {
									System.out.println("testing... " + (pure_index2 + (6 * j)));
									//NSLog(@"testing... pure_index3 at %i", pure_index2 + (6 * j));
									if (array[(pure_index2 / 6) + j][(pure_index2 % 6)] == group && ((pure_index2 / 6) + j != index / 6))	{	// check if top and bottom neighbors are definite candidates for grouping
										System.out.println("Success at this index");
										//NSLog(@"Success at this index");
										counter++;								// increment group counter for that group
										real_index3 = convertIndexes(pure_index2 + (6 * j));
										pure_index3 = pure_index2 + (6 * j);
										System.out.println("pure_index " + pure_index3 + " with real_index: " + real_index3);
										break;
									}
									else {
										System.out.println("Fail at this index.  Retesting");
										//NSLog(@"Fail at this index, retesting");
									}
										
								}
								if (counter == group) {
									// store boxView references in cage groups
									real_index1 = convertIndexes(index);
							/*		cage_group = [NSMutableArray arrayWithCapacity: 3];
									[cage_group addObject: [boxes objectAtIndex: real_index1]];
									[cage_group addObject: [boxes objectAtIndex: real_index2]];
									[cage_group addObject: [boxes objectAtIndex: real_index3]];
									[cages addObject: cage_group];
							*/
									foundNeighbor = true;
									System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
									System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
									System.out.println("PLACING BOX WITH INDEX " + real_index3 + "into cage");
								
									array[index / 6][index % 6] = 0;	// remove data from array
									array[(pure_index2/6)][(index % 6)] = 0;	// remove data from array
									array[(pure_index3/6)][(index % 6)] = 0;	// remove data from array
									
									System.out.println("Turn the following coordinates to 0");
									System.out.println("[" + (index/6) + " , " + (index%6) + "]");
									System.out.println("[" + (pure_index2/6) + " , " + (index%6) + "]");
									System.out.println("[" + (pure_index3/6) + " , " + (index%6) + "]");
									
							/*		NSLog(@"Turn the following coordinates to 0");
									NSLog(@"[%i , %i]", (index / 6), (index % 6));
									NSLog(@"[%i , %i]", (index / 6), (pure_index2 % 6));
									NSLog(@"[%i , %i]", (pure_index3 / 6), (pure_index2 % 6));
							*/		
									
									// 2 - numbers are DONE completely
									numbers[index] = 2;
									numbers[pure_index2] = 2;
									numbers[pure_index3] = 2;
									
							/*		NSLog(@"Found completed group");
									NSLog(@"pure_index1: %i", index);
									NSLog(@"pure_index2: %i", pure_index2);
									NSLog(@"pure_index3: %i", pure_index3);
									NSLog(@"real_index1: %i", real_index1);
									NSLog(@"real_index2: %i", real_index2);
									NSLog(@"real_index3: %i", real_index3);				
							*/
									System.out.println("Found completed group");
									System.out.println("pure_index: " + index + " with real_index: " + real_index1);
									System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
									System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
									break;
								}
							}
						}
						// test to see if group can be locked
						else if (counter == group && array[(index / 6) + k][(index % 6)] == group) {
							System.out.println("counter: " + counter);
							//NSLog(@"counter: %i", counter);
							// convert to the proper indexes
							real_index1 = convertIndexes(index);
							real_index3 = convertIndexes((index + (6 * k)));
							pure_index3 = (index + (6 * k));
							
							System.out.println("pure_index: " + index + " with real_index: " + real_index1);
							System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
							System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
							
						/*	NSLog(@"index: %i", index);
							NSLog(@"index + (6 * i): %i", index + (6 * k));
							NSLog(@"index + (6 * i): %i", pure_index2);
							NSLog(@"real_index1: %i", real_index1);
							NSLog(@"real_index2: %i", real_index2);
							NSLog(@"real_index3: %i", real_index3);
						*/	
							// store boxView references in cage groups
						/*	cage_group = [NSMutableArray arrayWithCapacity: 3];
							[cage_group addObject: [boxes objectAtIndex: real_index1]];
							[cage_group addObject: [boxes objectAtIndex: real_index2]];
							[cage_group addObject: [boxes objectAtIndex: real_index3]];
							[cages addObject: cage_group];
						*/
							foundNeighbor = true;
							System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
							System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
							System.out.println("PLACING BOX WITH INDEX " + real_index3 + "into cage");
					
							array[index / 6][index % 6] = 0;	// remove data from array
							array[index/6][(pure_index2 % 6)] = 0;	// remove data from array
							array[pure_index3/6][(index % 6)] = 0;	// remove data from array
							
							System.out.println("Turn the following coordinates to 0");
							System.out.println("[" + (index/6) + " , " + (index%6) + "]");
							System.out.println("[" + (index/6) + " , " + (pure_index2%6) + "]");
							System.out.println("[" + (pure_index3/6) + " , " + (index%6) + "]");
	
							// 2 - numbers are DONE completely
							numbers[index] = 2;
							numbers[index + (6 * k)] = 2;
							numbers[pure_index2] = 2;
							
							System.out.println("Found completed group");
							System.out.println("pure_index: " + index + " with real_index: " + real_index1);
							System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
							System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
							break;
						}
					}
				}	
				
				// if no groupings were made check for other FORCED groupings
				System.out.println("TESTING FOR FORCED GROUPINGS");
				//NSLog(@"TESTING FOR FORCED GROUPS*******************");
				counter = 1;
				for (k = -1; k <= 1; k+=2) {
					if (array[(index / 6)][(index % 6) + k] >= (group - 1))	{	// check if left and right neighbors are definite candidates for grouping
						counter++;											// increment group counter for that group
						//NSLog(@"counter: %i", counter);
						System.out.println("counter: " + counter);
						// test to see if one possible neighbor is found
						if (counter == (group - 1) && array[(index / 6)][(index % 6) + k] >= (group - 1)) {
							System.out.println("found first neighbor for group of 3");
							//NSLog(@"found first neighbor for group of 3");
							real_index2 = convertIndexes(index + k);
							pure_index2 = index + k;
							System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
							System.out.println("retesting for neighbors of " + pure_index2);
							//NSLog(@"pure_index2: %i", pure_index2);
							//NSLog(@"retesting for neighbors of pure_index2...");
							// now retest for the neighbor we just found left and right
							for (j = -1; j <= 1; j+=2) {
								System.out.println("testing... " + (pure_index2 + j));
								//NSLog(@"testing... pure_index3 at %i", pure_index2 + j);
								if (array[(pure_index2 / 6)][(pure_index2 % 6) + j] == group && ((pure_index2 % 6) + j != index % 6))	{	// check if left and right neighbors are definite candidates for grouping
									System.out.println("Success at this index");
									//NSLog(@"Success at this index");
									counter++;									// increment group counter for that group
									
									real_index3 = convertIndexes(pure_index2 + j);
									pure_index3 = pure_index2 + j;
									System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
									break;
								}
								else {
									//NSLog(@"Fail at this index, retesting");
									System.out.println("Fail at this index.  Retesting");
								}
									
							}
							if (counter == group) {
								// store boxView references in cage groups
								real_index1 = convertIndexes(index);
							/*	cage_group = [NSMutableArray arrayWithCapacity: 3];
								[cage_group addObject: [boxes objectAtIndex: real_index1]];
								[cage_group addObject: [boxes objectAtIndex: real_index2]];
								[cage_group addObject: [boxes objectAtIndex: real_index3]];
								[cages addObject: cage_group];
							*/
							
								System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
								System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
								System.out.println("PLACING BOX WITH INDEX " + real_index3 + "into cage");
							
								foundNeighbor = true;
								System.out.println("Turn the following coordinates to 0");
								System.out.println("[" + (index/6) + " , " + (index%6) + "]");
								System.out.println("[" + (index/6) + " , " + (pure_index2%6) + "]");
								System.out.println("[" + (index/6) + " , " + (pure_index3%6) + "]");
							/*	NSLog(@"Turn the following coordinates to 0");
								NSLog(@"[%i , %i]", (index / 6), (index % 6));
								NSLog(@"[%i , %i]", (index / 6), (pure_index2 % 6));
								NSLog(@"[%i , %i]", (index / 6), (pure_index3 % 6));
							*/	
								array[index / 6][index % 6] = 0;	// remove data from array
								array[(index / 6)][(pure_index2 % 6)] = 0;	// remove data from array
								array[(index / 6)][(pure_index3 % 6)] = 0;	// remove data from array
								
								// 2 - numbers are DONE completely
								numbers[index] = 2;
								numbers[pure_index2] = 2;
								numbers[pure_index3] = 2;
								
								System.out.println("Found completed group");
								System.out.println("pure_index: " + index + " with real_index: " + real_index1);
								System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
								System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
								
							/*	NSLog(@"Found completed group");
								NSLog(@"pure_index1: %i", index);
								NSLog(@"pure_index2: %i", pure_index2);
								NSLog(@"pure_index3: %i", pure_index3);
								NSLog(@"real_index1: %i", real_index1);
								NSLog(@"real_index2: %i", real_index2);
								NSLog(@"real_index3: %i", real_index3);
							*/
								break;
							}
							// retest for the neighbor we just found up and down
							else {
								for (j = -1; j <= 1; j+=2) {
									System.out.println("testing... " + (pure_index2 + (6 * j)));
									//NSLog(@"testing... pure_index3 at %i", pure_index2 + (6 * j));
									if (array[(pure_index2 / 6) + j][(pure_index2 % 6)] == group)	{	// check if top and bottom neighbors are definite candidates for grouping
										System.out.println("Success at this index");
										//NSLog(@"Success at this index");
										counter++;									// increment group counter for that group
										real_index3 = convertIndexes(pure_index2 + (6 * j));
										pure_index3 = pure_index2 + (6 * j);
										System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
										break;
									}
									else {
										//NSLog(@"Fail at this index, retesting");
										System.out.println("Fail at this index,  Retesting");
									}	
								}
								if (counter == group) {
									// store boxView references in cage groups
									real_index1 = convertIndexes(index);
							/*		cage_group = [NSMutableArray arrayWithCapacity: 3];
									[cage_group addObject: [boxes objectAtIndex: real_index1]];
									[cage_group addObject: [boxes objectAtIndex: real_index2]];
									[cage_group addObject: [boxes objectAtIndex: real_index3]];
									[cages addObject: cage_group];
							*/
									System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
									System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
									System.out.println("PLACING BOX WITH INDEX " + real_index3 + "into cage");
							
									foundNeighbor = true;
									array[index / 6][index % 6] = 0;	// remove data from array
									array[(index / 6)][(pure_index2 % 6)] = 0;	// remove data from array
									array[(pure_index3 / 6)][(pure_index2 % 6)] = 0;	// remove data from array
									
									System.out.println("Turn the following coordinates to 0");
									System.out.println("[" + (index/6) + " , " + (index%6) + "]");
									System.out.println("[" + (index/6) + " , " + (pure_index2%6) + "]");
									System.out.println("[" + (pure_index3/6) + " , " + (pure_index2%6) + "]");
									
							/*		NSLog(@"Turn the following coordinates to 0");
									NSLog(@"[%i , %i]", (index / 6), (index % 6));
									NSLog(@"[%i , %i]", (index / 6), (pure_index2 % 6));
									NSLog(@"[%i , %i]", (pure_index3 / 6), (pure_index2 % 6));
							*/		
									// 2 - numbers are DONE completely
									numbers[index] = 2;
									numbers[pure_index2] = 2;
									numbers[pure_index3] = 2;
									
									System.out.println("Found completed group");
									System.out.println("pure_index: " + index + " with real_index: " + real_index1);
									System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
									System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
									
							/*		NSLog(@"Found completed group");
									NSLog(@"pure_index1: %i", index);
									NSLog(@"pure_index2: %i", pure_index2);
									NSLog(@"pure_index3: %i", pure_index3);
									NSLog(@"real_index1: %i", real_index1);
									NSLog(@"real_index2: %i", real_index2);
									NSLog(@"real_index3: %i", real_index3);
							*/
									break;
								}
							}
						}
						// test to see if group can be locked (STILL LEFT AND RIGHT)
						else if (counter == group && array[(index / 6)][(index % 6) + k] == group) {
							System.out.println("counter: " + counter);
							System.out.println("group: " + group);
							
							//NSLog(@"counter: %i", counter);
							//NSLog(@"group: %i", group);
							// convert to the proper indexes
							real_index1 = convertIndexes(index);
							real_index3 = convertIndexes(index + k);
							pure_index3 = (index + k);
							System.out.println("pure_index: " + index + " with real_index: " + real_index1);
							System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
							System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
							
					/*		NSLog(@"index: %i", index);
							NSLog(@"index + i: %i", index + k);
							NSLog(@"index + i: %i", pure_index2);
							NSLog(@"real_index1: %i", real_index1);
							NSLog(@"real_index2: %i", real_index2);
							NSLog(@"real_index3: %i", real_index3);
					*/		
							// store boxView references in cage groups
					/*		cage_group = [NSMutableArray arrayWithCapacity: 3];
							[cage_group addObject: [boxes objectAtIndex: real_index1]];
							[cage_group addObject: [boxes objectAtIndex: real_index2]];
							[cage_group addObject: [boxes objectAtIndex: real_index3]];
							[cages addObject: cage_group];
					*/
							System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
							System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
							System.out.println("PLACING BOX WITH INDEX " + real_index3 + "into cage");
		
							foundNeighbor = true;
							System.out.println("Turn the following coordinates to 0");
							System.out.println("[" + (index/6) + " , " + (index%6) + "]");
							System.out.println("[" + (index/6) + " , " + (pure_index2%6) + "]");
							System.out.println("[" + (index/6) + " , " + (pure_index3%6) + "]");
							
							array[index / 6][index % 6] = 0;	// remove data from array
							array[(index / 6)][pure_index2 % 6] = 0;	// remove data from array
							array[(index / 6)][pure_index3 % 6] = 0;	// remove data from array
							
							// 2 - numbers are DONE completely
							numbers[index] = 2;
							numbers[index + k] = 2;
							numbers[pure_index2] = 2;
						
							System.out.println("Found completed group");
							System.out.println("pure_index: " + index + " with real_index: " + real_index1);
							System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
							System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
							break;
						}
					}
				}
				if (foundNeighbor == true) {
					foundNeighbor = false;
					printArray(array);
					continue;
				}
				for (k = -1; k <= 1; k+=2) {
					if (array[(index / 6) + k][(index % 6)] >= (group - 1))	{	// check if top and bottom neighbors are definite candidates for grouping
						counter++;	
						System.out.println("counter: " + counter);
						System.out.println("group " + group);				// increment group counter for that group
						//NSLog(@"counter: %i", counter);
						// test to see if one possible neighbor is found
						if (counter == (group - 1) && array[(index / 6) + k][(index % 6)] >= (group - 1)) {
							System.out.println("found first neighbor for group of 3");
							//NSLog(@"found first neighbor for group of 3");
							real_index2 = convertIndexes((index + (6 * k)));
							pure_index2 = (index + (6 * k));
							//NSLog(@"pure_index2: %i", pure_index2);
							//NSLog(@"retesting for neighbors of pure_index2...");
							System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
							// now retest for the neighbor we just found left and right
							
							for (j = -1; j <= 1; j+=2) {
								System.out.println("testing... " + (pure_index2 + j));
								//NSLog(@"testing... pure_index3 at %i", pure_index2 + j);
								if (array[(pure_index2 / 6)][(pure_index2 % 6) + j] >= (group - 1))	{	// check if left and right neighbors are definite candidates for grouping
									System.out.println("Success at this index");
									//NSLog(@"Success at this index");
									counter++;									// increment group counter for that group
									real_index3 = convertIndexes(pure_index2 + j);
									pure_index3 = pure_index2 + j;
									System.out.println("pure_index " + pure_index3 + " with real_index: " + real_index3);
									break;
								}
								else {
									System.out.println("Fail at this index.  Retesting");
									//NSLog(@"Fail at this index, retesting");
								}
							}
							if (counter == group) {
								// store boxView references in cage groups
								real_index1 = convertIndexes(index);
							/*	cage_group = [NSMutableArray arrayWithCapacity: 3];
								[cage_group addObject: [boxes objectAtIndex: real_index1]];
								[cage_group addObject: [boxes objectAtIndex: real_index2]];
								[cage_group addObject: [boxes objectAtIndex: real_index3]];
								[cages addObject: cage_group];
							*/
								foundNeighbor = true;
								
								System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
								System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
								System.out.println("PLACING BOX WITH INDEX " + real_index3 + "into cage");
								
								System.out.println("Turn the following coordinates to 0");
								System.out.println("[" + (index/6) + " , " + (index%6));
								System.out.println("[" + (pure_index2/6) + " , " + (index%6));
								System.out.println("[" + (pure_index2/6) + " , " + (pure_index3%6));
								
							/*	NSLog(@"Turn the following coordinates to 0");
								NSLog(@"[%i , %i]", (index / 6), (index % 6));
								NSLog(@"[%i , %i]", (index / 6), (pure_index2 % 6));
								NSLog(@"[%i , %i]", (index / 6), (pure_index3 % 6));
							*/		  
								array[index / 6][index % 6] = 0;	// remove data from array
								array[(pure_index2/ 6)][(index % 6)] = 0;	// remove data from array
								array[(pure_index2/ 6)][(pure_index3 % 6)] = 0;	// remove data from array
								
								// 2 - numbers are DONE completely
								numbers[index] = 2;
								numbers[pure_index2] = 2;
								numbers[pure_index3] = 2;
								
							/*	NSLog(@"Found completed group");
								NSLog(@"pure_index1: %i", index);
								NSLog(@"pure_index2: %i", pure_index2);
								NSLog(@"pure_index3: %i", pure_index3);
								NSLog(@"real_index1: %i", real_index1);
								NSLog(@"real_index2: %i", real_index2);
								NSLog(@"real_index3: %i", real_index3);							
							*/
							
								System.out.println("Found completed group");
								System.out.println("pure_index: " + index + " with real_index: " + real_index1);
								System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
								System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
								break;
							}
							// retest for the neighbor we just found up and down
							else {
								for (j = -1; j <= 1; j+=2) {
									System.out.println("testing... " + (pure_index2 + (6 * j)));
									//NSLog(@"testing... pure_index3 at %i", pure_index2 + (6 * j));
									if (array[(pure_index2 / 6) + j][(pure_index2 % 6)] >= (group - 1) && ((pure_index2 / 6) + j != index / 6))	{	// check if top and bottom neighbors are definite candidates for grouping
										System.out.println("Success at this index");
										//NSLog(@"Success at this index");
										counter++;								// increment group counter for that group
										real_index3 = convertIndexes(pure_index2 + (6 * j));
										pure_index3 = pure_index2 + (6 * j);
										System.out.println("pure_index " + pure_index3 + " with real_index: " + real_index3);
										break;
									}
									else {
										System.out.println("Fail at this index.  Retesting");
										//NSLog(@"Fail at this index, retesting");
									}
										
								}
								if (counter == group) {
									// store boxView references in cage groups
									real_index1 = convertIndexes(index);
							/*		cage_group = [NSMutableArray arrayWithCapacity: 3];
									[cage_group addObject: [boxes objectAtIndex: real_index1]];
									[cage_group addObject: [boxes objectAtIndex: real_index2]];
									[cage_group addObject: [boxes objectAtIndex: real_index3]];
									[cages addObject: cage_group];
							*/
									foundNeighbor = true;
									System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
									System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
									System.out.println("PLACING BOX WITH INDEX " + real_index3 + "into cage");
								
									array[index / 6][index % 6] = 0;	// remove data from array
									array[(pure_index2/6)][(index % 6)] = 0;	// remove data from array
									array[(pure_index3/6)][(index % 6)] = 0;	// remove data from array
									
									System.out.println("Turn the following coordinates to 0");
									System.out.println("[" + (index/6) + " , " + (index%6) + "]");
									System.out.println("[" + (pure_index2/6) + " , " + (index%6) + "]");
									System.out.println("[" + (pure_index3/6) + " , " + (index%6) + "]");
									
							/*		NSLog(@"Turn the following coordinates to 0");
									NSLog(@"[%i , %i]", (index / 6), (index % 6));
									NSLog(@"[%i , %i]", (index / 6), (pure_index2 % 6));
									NSLog(@"[%i , %i]", (pure_index3 / 6), (pure_index2 % 6));
							*/		
									
									// 2 - numbers are DONE completely
									numbers[index] = 2;
									numbers[pure_index2] = 2;
									numbers[pure_index3] = 2;
									
							/*		NSLog(@"Found completed group");
									NSLog(@"pure_index1: %i", index);
									NSLog(@"pure_index2: %i", pure_index2);
									NSLog(@"pure_index3: %i", pure_index3);
									NSLog(@"real_index1: %i", real_index1);
									NSLog(@"real_index2: %i", real_index2);
									NSLog(@"real_index3: %i", real_index3);				
							*/
									System.out.println("Found completed group");
									System.out.println("pure_index: " + index + " with real_index: " + real_index1);
									System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
									System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
									break;
								}
							}
						}
						// test to see if group can be locked
						else if (counter == group && array[(index / 6) + k][(index % 6)] >= (group - 1)) {
							System.out.println("counter: " + counter);
							//NSLog(@"counter: %i", counter);
							// convert to the proper indexes
							real_index1 = convertIndexes(index);
							real_index3 = convertIndexes((index + (6 * k)));
							pure_index3 = (index + (6 * k));
							
							System.out.println("pure_index: " + index + " with real_index: " + real_index1);
							System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
							System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
							
						/*	NSLog(@"index: %i", index);
							NSLog(@"index + (6 * i): %i", index + (6 * k));
							NSLog(@"index + (6 * i): %i", pure_index2);
							NSLog(@"real_index1: %i", real_index1);
							NSLog(@"real_index2: %i", real_index2);
							NSLog(@"real_index3: %i", real_index3);
						*/	
							// store boxView references in cage groups
						/*	cage_group = [NSMutableArray arrayWithCapacity: 3];
							[cage_group addObject: [boxes objectAtIndex: real_index1]];
							[cage_group addObject: [boxes objectAtIndex: real_index2]];
							[cage_group addObject: [boxes objectAtIndex: real_index3]];
							[cages addObject: cage_group];
						*/
							foundNeighbor = true;
							System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage");
							System.out.println("PLACING BOX WITH INDEX " + real_index2 + "into cage");
							System.out.println("PLACING BOX WITH INDEX " + real_index3 + "into cage");
					
							array[index / 6][index % 6] = 0;	// remove data from array
							array[index / 6][(pure_index2 % 6)] = 0;	// remove data from array
							array[pure_index3 / 6][(index % 6)] = 0;	// remove data from array
							
							System.out.println("Turn the following coordinates to 0");
							System.out.println("[" + (index/6) + " , " + (index%6) + "]");
							System.out.println("[" + (index/6) + " , " + (pure_index2%6) + "]");
							System.out.println("[" + (pure_index3/6) + " , " + (index%6) + "]");
	
							// 2 - numbers are DONE completely
							numbers[index] = 2;
							numbers[index + (6 * k)] = 2;
							numbers[pure_index2] = 2;
							
							System.out.println("Found completed group");
							System.out.println("pure_index: " + index + " with real_index: " + real_index1);
							System.out.println("pure_index: " + pure_index2 + " with real_index: " + real_index2);
							System.out.println("pure_index: " + pure_index3 + " with real_index: " + real_index3);
							break;
						}
					}
				}
			}
			printArray(array);
		}
		printNumbers(numbers);
		// check for "leftovers" that did not get grouped
		for (i = 0; i <  numbers.length; i++) {
			// if leftover (ungrouped)
			if (numbers[i] == 1) {
				real_index1 = convertIndexes(i);
				// check all neighbors to form groups of 2
				// check left
				if (numbers[i - 1] == 1) {
					real_index2 = convertIndexes(i - 1);
					System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage of 2 with " + real_index2);
					// remove data
					numbers[i] = 2;
					numbers[i - 1] = 2;
				}
				// check right
				else if (numbers[i + 1] == 1) {
					real_index2 = convertIndexes(i + 1);
					System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage of 2 with " + real_index2);
					// remove data
					numbers[i] = 2;
					numbers[i + 1] = 2;
				}
				// check top
				else if (numbers[i - 6] == 1) {
					real_index2 = convertIndexes(i - 6);
					System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage of 2 with " + real_index2);
					// remove data
					numbers[i] = 2;
					numbers[i - 6] = 2;
				}
				else if (numbers[i + 6] == 1) {
					real_index2 = convertIndexes(i + 6);
					System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into cage of 2 with " + real_index2);
					// remove data
					numbers[i] = 2;
					numbers[i + 6] = 2;
				}
				// no neighbors so must go in single cage
				else {
					System.out.println("PLACING BOX WITH INDEX " + real_index1 + "into a SINGLE cage");	
					numbers[i] = 2;
				}
				//cage_group = [NSMutableArray arrayWithCapacity: 1];
				//[cage_group addObject: [boxes objectAtIndex: real_index1]];
				//[cages addObject: cage_group];
			}
		}
		System.out.println("AFTER PROCESSING LEFTOVERS");
		printNumbers(numbers);
		printArray(array);
		//return cages;
	}			
}