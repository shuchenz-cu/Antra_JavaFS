// See https://aka.ms/new-console-template for more information
using Console = System.Console;

int[] numbers;
numbers = new int[] {1, 3, 2, 5, 7, 9, 10, 8, 6, 4};
int[] numbers2;
numbers2 = new int[numbers.Length];
for (int i = 0; i < numbers.Length; i++)
{
    numbers2[i] = numbers[i];
}
Console.WriteLine("[{0}]", string.Join(", ", numbers));

Console.Write("[{0}]", string.Join(", ", numbers2));