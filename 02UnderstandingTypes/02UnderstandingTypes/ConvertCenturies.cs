namespace _02UnderstandingTypes;

public class ConvertCenturies
{
    public void Convert(int centuries)
    { 
        System.Console.WriteLine($"Input: {centuries}");
        int years = centuries * 100;
        int days = years * 365;
        int hours = days * 24;
        long minutes = hours * 60;
        long seconds = minutes * 60;
        long milliseconds = seconds * 1000;
        long microseconds = milliseconds * 1000;
        long nanoseconds = microseconds * 1000;
        Console.WriteLine($"{centuries} centuries = {years} years = {days} days = {hours} " +
                          $"hours = {minutes} minutes = {seconds} seconds = {milliseconds} milliseconds = " +
                          $"{microseconds} microseconds = {nanoseconds} nanoseconds"); 
    }
}