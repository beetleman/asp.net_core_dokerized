using System;
using System.ComponentModel.DataAnnotations;

namespace app {
    public class HumanViewModel {
        [Required, MaxLength(100)]
        public string Name { get; set; }

        [Required, MaxLength(100)]
        public string Surname { get; set; }

        [MaxLength(100)]
        public string Nickname { get; set; }

        [Required]
        public string Country { get; set; }

        [Required]
        public string Gender { get; set; }
    }
}
