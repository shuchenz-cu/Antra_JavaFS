// See https://aka.ms/new-console-template for more information

int correctNumber = new Random().Next(3) + 1;
Console.WriteLine("Take a guess between 1 to 3: ");
int guessedNumber = int.Parse(Console.ReadLine()!);
Console.Write($"Your guess is {guessedNumber}, ");

if (guessedNumber < 1 | guessedNumber > 3)
{
    Console.Write("Your input is invalid. Please check again.");
}
else
{
    while (guessedNumber != correctNumber)
    {
        if (guessedNumber < correctNumber)
        {
            Console.WriteLine("lower than the correct number."); 
        } else
        {
            Console.WriteLine("higher than the correct number."); 
        }
        Console.WriteLine("Take a guess between 1 to 3: ");
        guessedNumber = int.Parse(Console.ReadLine()!);
        Console.Write($"Your guess is {guessedNumber}, ");
    }
    Console.WriteLine("which is the correct answer!"); 
}