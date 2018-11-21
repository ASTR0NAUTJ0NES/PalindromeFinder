-- File: pal_finder.adb
-- Name: Andrew Albanese
-- Date: 1/24/2018

-- Purpose: a program that reads a series of strings 
-- and prints one of five messages that indicates whether 
-- each string is a palindrome or can be converted into 
-- a palindrome. 

WITH Ada.Text_IO; USE Ada.Text_IO;
WITH Ada.Float_Text_IO; USE Ada.Float_Text_IO;
WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO;
--read from a file with "./setops < myTextFile"

PROCEDURE pal_finder IS

   I : Integer;
   Size : Integer;
   SetSum : Float;
   Average : Float;
   LargestInSet : Integer;
   SecondLargestInSet : Integer;
   SetNumber : Integer;
   AverageOfAverages : Float;
   SumOfAverages : Float;
   LargestSecondLargest : Integer;

BEGIN
   Size := 1;
   SetNumber := 0;
   AverageOfAverages := 0.0;
   LargestSecondLargest := 0;
   SumOfAverages := 0.0;
   LOOP
      SetNumber := SetNumber + 1;
      Get(Size);
      EXIT WHEN Size = 0;
      SetSum := 0.0;
      LargestInSet := 0;
      SecondLargestInSet := 0;
      FOR ii IN 1 .. Size LOOP
         Get(I);
         SetSum := SetSum + Float(I);
         IF I > LargestInSet THEN
            SecondLargestInSet := LargestInSet;
            LargestInSet := I;
         ELSIF I > SecondLargestInSet THEN
            SecondLargestInSet := I;
         END IF;
      END LOOP;

      Average := SetSum / Float(Size);
      Put_Line("Set: " & SetNumber'Img);
      Put_Line("  Size: " & Size'Img);
      Put("  Average: ");
      Put(Average, Fore => 3, Aft => 2, Exp => 0);
      New_Line;
      Put_Line("  Second Largest: " & SecondLargestInSet'Img);
      New_Line;
      IF SecondLargestInSet > LargestSecondLargest THEN
         LargestSecondLargest := SecondLargestInSet;
      END IF;
      SumOfAverages := SumOfAverages + Average;
      AverageOfAverages := SumOfAverages / Float(SetNumber);
   END LOOP;
   Put("Average of Averages: ");
   Put(AverageOfAverages, Fore => 3, Aft => 2, Exp => 0);
   New_Line;
   Put_Line("Largest second Largest: " & LargestSecondLargest'Img);
END pal_finder;
