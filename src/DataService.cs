using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

using System.Data.SqlClient;
using System.Data;

namespace app
{
    public class DataService
    {

        private readonly AppSettings AppSettings;
        public DataService(IOptions<AppSettings> appSettings) {
            AppSettings = appSettings.Value;
        }

        public List<HumanDetails> getAllHumans()
        {
            List<HumanDetails> humansDetails = new List<HumanDetails>(); ;
            using (SqlConnection con = new SqlConnection(AppSettings.ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("EXEC getHumansDetails", con);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    humansDetails.Add(new HumanDetails {
                            Id = reader.GetInt32(0),
                            Name = reader.GetString(1),
                            Surname = reader.GetString(2),
                            Nick = reader.GetString(3),
                            CountryID = reader.GetInt32(4),
                            GenderID = reader.GetInt32(5),
                            CountryName = reader.GetString(6),
                            ContinentName = reader.GetString(7),
                            GenderName = reader.GetString(8)
                        });
                }
            }
            return humansDetails;
        }

        public List<CountryDetails> getAllCountries()
        {
            List<CountryDetails> countriesDetails = new List<CountryDetails>(); ;
            using (SqlConnection con = new SqlConnection(AppSettings.ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("EXEC getCountriesDetails", con);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    countriesDetails.Add(new CountryDetails {
                            Id = reader.GetInt32(0),
                            Name = reader.GetString(1),
                            Capital = reader.GetString(2),
                            Area = reader.GetInt32(3),
                            ContinentID = reader.GetInt32(4),
                            ContinentName = reader.GetString(5)
                        });
                }
            }
            return countriesDetails;
        }

        public List<Continent> getAllContinents()
        {
            List<Continent> continents = new List<Continent>(); ;
            using (SqlConnection con = new SqlConnection(AppSettings.ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("EXEC getContinents", con);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    continents.Add(new Continent {
                            Id = reader.GetInt32(0),
                            Name = reader.GetString(1),
                            Area = reader.GetInt32(2),
                        });
                }
            }
            return continents;
        }

        public List<Gender> getAllGenders()
        {
            List<Gender> genders = new List<Gender>(); ;
            using (SqlConnection con = new SqlConnection(AppSettings.ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("EXEC getGenders", con);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    genders.Add(new Gender {
                            Id = reader.GetInt32(0),
                            Name = reader.GetString(1),
                        });
                }
            }
            return genders;
        }
    }
}
