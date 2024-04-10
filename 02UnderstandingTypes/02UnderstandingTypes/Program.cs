// See https://aka.ms/new-console-template for more information
using _02UnderstandingTypes;
using Console = System.Console;

Console.WriteLine("The following data types has number of bytes, minimum and maximum value of:");
Console.WriteLine($"sbyte: {sizeof(sbyte)}, {sbyte.MinValue}, {sbyte.MaxValue}");
Console.WriteLine($"byte: {sizeof(byte)}, {byte.MinValue}, {byte.MaxValue}");
Console.WriteLine($"short: {sizeof(short)}, {short.MinValue}, {short.MaxValue}");
Console.WriteLine($"ushort: {sizeof(ushort)}, {ushort.MinValue}, {ushort.MaxValue}");
Console.WriteLine($"int: {sizeof(int)}, {int.MinValue}, {int.MaxValue}");
Console.WriteLine($"uint: {sizeof(uint)}, {uint.MinValue}, {uint.MaxValue}");
Console.WriteLine($"long: {sizeof(long)}, {long.MinValue}, {long.MaxValue}");
Console.WriteLine($"ulong: {sizeof(ulong)}, {ulong.MinValue}, {ulong.MaxValue}");
Console.WriteLine($"float: {sizeof(float)}, {float.MinValue}, {float.MaxValue}");
Console.WriteLine($"double: {sizeof(double)}, {double.MinValue}, {double.MaxValue}");
Console.WriteLine($"decimal: {sizeof(decimal)}, {decimal.MinValue}, {decimal.MaxValue}");



// ConvertCenturies demo = new ConvertCenturies();
// int a = 1;
// demo.Convert(a);



// Loop and Operators

// int max = 500;
// for (byte i = 0; i < max; i++)
// {
//     Console.WriteLine(i);
// }

// The above code will keep running because data type byte have the maximum range to 255.
// I would add an 'if' code before to check if i has been ever reset to 0. If it has, stop the loop immediately.
