using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class Laboratory
    {
        public Laboratory()
        {
            Abilities = new HashSet<Ability>();
            Equipment = new HashSet<Equipment>();
            Requests = new HashSet<Request>();
            Wards = new HashSet<Ward>();
        }

        public Guid Id { get; set; }
        public string Title { get; set; } = null!;
        public int LaboratoryTypeId { get; set; }
        public int PassiveDefenceId { get; set; }
        public int? ApprovalAuthorityId { get; set; }
        public int? StandardStatusId { get; set; }
        public int? ResearchCenterId { get; set; }
        public string? PhoneNumber { get; set; }
        public string? ImagePath { get; set; }
        public string? Address { get; set; }
        public string? Description { get; set; }

        public virtual BaseInfo? ApprovalAuthority { get; set; }
        public virtual BaseInfo LaboratoryType { get; set; } = null!;
        public virtual BaseInfo PassiveDefence { get; set; } = null!;
        public virtual BaseInfo? ResearchCenter { get; set; }
        public virtual BaseInfo? StandardStatus { get; set; }
        public virtual ICollection<Ability> Abilities { get; set; }
        public virtual ICollection<Equipment> Equipment { get; set; }
        public virtual ICollection<Request> Requests { get; set; }
        public virtual ICollection<Ward> Wards { get; set; }
    }
}
