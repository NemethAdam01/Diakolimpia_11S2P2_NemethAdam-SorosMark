using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySqlConnector;

namespace diakolimpia
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var builder = new MySqlConnectionStringBuilder
            {
                Server = "127.0.0.1",
                UserID = "root",
                Password = "",
            };
            var kapcsolat = new MySqlConnection(builder.ConnectionString);
            kapcsolat.Open();
            var parancs = kapcsolat.CreateCommand();
            parancs.CommandText = "USE íjászat; SELECT név FROM `játékosadatok` ORDER BY helyezés ASC LIMIT 3;";
            var olvaso = parancs.ExecuteReader();
            while (olvaso.Read())
            {
                Console.WriteLine($"helyezettek: {olvaso.GetString(0)}");                
            }
            olvaso.Close();
            Console.ReadKey();
        }
    }
}
