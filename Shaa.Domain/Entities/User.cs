using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class User
    {
        public Guid Id { get; set; }
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;
        public string? PhoneNumber { get; set; }
        public string? Email { get; set; }
        public string NationalNo { get; set; } = null!;
        public string? Description { get; set; }
        public string Password { get; set; } = null!;
        public DateTime? BirthDate { get; set; }
        public int? CountryId { get; set; }
        public int? CityId { get; set; }
        public bool IsEmailConfirmed { get; set; }
        public bool IsAdmin { get; set; }
        public bool IsBanned { get; set; }
        public string? EmailActivationCode { get; set; }
        public Guid? DepartmentId { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime? CreationDate { get; set; }

        public virtual BaseInfo? City { get; set; }
        public virtual BaseInfo? Country { get; set; }
        public virtual Department? Department { get; set; }
    }
}
