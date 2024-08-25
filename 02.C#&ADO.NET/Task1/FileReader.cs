using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task1
{
    public  class FileReader
    {
        static List<User> users = new();
        public static List<User> CreateList(string path)
        {
            using (FileStream fileStream = new(path, FileMode.Open, FileAccess.Read))
            {
                using (StreamReader streamReader = new(fileStream))
                {
                    streamReader.ReadLine();
                    while (!streamReader.EndOfStream)
                    {
                        var line = streamReader.ReadLine()?.Split(',');
                        //Console.WriteLine(line);
                        if (line is not null)
                        {
                            User user = new()
                            {
                                UserId = int.Parse(line[0]),
                                UserName = line[1],
                                Email = line[2],
                                PasswordHash = line[3],
                                Status = line[4],
                                AddressLine1 = line[5],
                                AddressLine2 = line[6],
                                City = line[7],
                                State = line[8],
                                PostalCode = line[9],
                                CountryId = int.Parse(line[10]),
                                CreatedAt = DateTime.Parse(line[11]),
                            };

                            users.Add(user);
                        }
                    }
                }
                return users;
            }
        }
    }
}
