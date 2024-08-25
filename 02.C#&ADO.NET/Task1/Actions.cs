using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Task1
{
    public class Actions
    {
        private readonly string conString;
        // Default constructor
        public Actions()
        { 
            conString = "Server = .; Database = UserDB; Integrated Security = true; TrustServerCertificate = True";
        }

        public async Task<int> InsertIntoUsersTable(List<User> users)
        {
            using (SqlConnection sqlConnection = new SqlConnection(conString))
            {
                await sqlConnection.OpenAsync();
                using (SqlCommand cmd = sqlConnection.CreateCommand())
                {
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.CommandText = "INSERT INTO Users (UserID, Username, Email, PasswordHash, Status, AddressLine1, AddressLine2, City, State, PostalCode, CountryID, CreatedAt) VALUES ";

                    var valueStrings = new List<string>();
                    for (int i = 0; i < users.Count; i++)
                    {
                        var user = users[i];
                        valueStrings.Add($"(@UserID{i}, @Username{i}, @Email{i}, @PasswordHash{i}, @Status{i}, @AddressLine1{i}, @AddressLine2{i}, @City{i}, @State{i}, @PostalCode{i}, @CountryId{i}, @CreatedAt{i})");

                        cmd.Parameters.AddWithValue($"@UserID{i}", user.UserId);
                        cmd.Parameters.AddWithValue($"@Username{i}", user.UserName);
                        cmd.Parameters.AddWithValue($"@Email{i}", user.Email);
                        cmd.Parameters.AddWithValue($"@PasswordHash{i}", user.PasswordHash);
                        cmd.Parameters.AddWithValue($"@Status{i}", user.Status);
                        cmd.Parameters.AddWithValue($"@AddressLine1{i}", user.AddressLine1);
                        cmd.Parameters.AddWithValue($"@AddressLine2{i}", user.AddressLine2);
                        cmd.Parameters.AddWithValue($"@City{i}", user.City);
                        cmd.Parameters.AddWithValue($"@State{i}", user.State);
                        cmd.Parameters.AddWithValue($"@PostalCode{i}", user.PostalCode);
                        cmd.Parameters.AddWithValue($"@CountryId{i}", user.CountryId);
                        cmd.Parameters.AddWithValue($"@CreatedAt{i}", user.CreatedAt);
                    }

                    cmd.CommandText += string.Join(",", valueStrings);
                    try
                    {
                        return await cmd.ExecuteNonQueryAsync();
                    }catch (Exception ex)
                    {
                        Console.WriteLine("Dublicated rows Ids exception");
                        return 0;
                    }
                }
            }
        }
    }
}
