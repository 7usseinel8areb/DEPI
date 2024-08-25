// See https://aka.ms/new-console-template for more information
using Microsoft.Extensions.Configuration;
using System.Data;
using Task1;

/*
 How Stream work
    File => FileStream => Decrator => Adaptars => App
    File  < FileStream  < Decrator  < Adaptars  < App
 */
Console.ForegroundColor = ConsoleColor.Green;

string url = "C:\\DEPI\\02.C#&ADO.NET\\Task1\\Material\\users.csv";

List <User> users= FileReader.CreateList(url);

Actions actions = new();
int affecterows = await actions.InsertIntoUsersTable(users);

if (affecterows > 0)
{
    Console.WriteLine($"Inserted to database succesfully {affecterows} affected rows ;)");
}
else
{
    Console.WriteLine($"Failed inserting to the database {affecterows} affected rows");
}

Console.ForegroundColor =ConsoleColor.Red;
Console.ReadKey();