using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace app.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppSettings AppSettings;
        private readonly DataService DataService;
        public HomeController(IOptions<AppSettings> appSettings, DataService dataService) {
            AppSettings = appSettings.Value;
            DataService = dataService;
        }

        public IActionResult Index()
        {
            ViewData["allHumans"] = DataService.getAllHumans();
            return View();
        }


        public IActionResult AddHuman()
        {
            ViewData["allCountries"] = DataService.getAllCountries();
            ViewData["allGenders"] = DataService.getAllGenders();
            return View();
        }

        [HttpPost]
        public IActionResult AddHuman(HumanViewModel input)
        {
            ViewData["allCountries"] = DataService.getAllCountries();
            ViewData["allGenders"] = DataService.getAllGenders();
            Console.WriteLine("Post");
            Console.WriteLine(input.Name);
            return View();
        }

        public IActionResult Countries()
        {
            ViewData["allCountries"] = DataService.getAllCountries();
            return View();
        }

        public IActionResult Continents()
        {
            ViewData["allContinents"] = DataService.getAllContinents();
            return View();
        }

        public IActionResult Genders()
        {
            ViewData["allGenders"] = DataService.getAllGenders();
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";
            ViewData["ConnectionString"] = AppSettings.ConnectionString;
            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";
            return View();
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}
