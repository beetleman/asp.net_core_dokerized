using System;

namespace app
{
    public class HumanDetails {
        public int Id { set; get; }
        public string Name { set; get; }
        public string Surname { set; get; }
        public string Nick { set; get; }

        public int CountryID { set; get; }
        public string CountryName { set; get; }

        public int GenderID { set; get; }
        public string GenderName { set; get; }

        public int ContinentID { set; get; }
        public string ContinentName { set; get; }
    }

    public class CountryDetails {
        public int Id { set; get; }
        public string Name { set; get; }
        public string Capital { set; get; }
        public int Area { set; get; }
        public int ContinentID { set; get; }
        public string ContinentName { set; get; }
    }

    public class Continent {
        public int Id { set; get; }
        public string Name { set; get; }
        public int Area { set; get; }
    }

    public class Gender {
        public int Id { set; get; }
        public string Name { set; get; }
    }

}
