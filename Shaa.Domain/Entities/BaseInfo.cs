using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class BaseInfo
    {
        public BaseInfo()
        {
            Departments = new HashSet<Department>();
            EquipmentCountries = new HashSet<Equipment>();
            EquipmentEmploymentStatuses = new HashSet<Equipment>();
            EquipmentEquipmentStatuses = new HashSet<Equipment>();
            EquipmentEquipmentTypes = new HashSet<Equipment>();
            EquipmentRelatedSections = new HashSet<Equipment>();
            EquipmentSupplyTypes = new HashSet<Equipment>();
            EquipmentUsageTypes = new HashSet<Equipment>();
            LaboratoryApprovalAuthorities = new HashSet<Laboratory>();
            LaboratoryLaboratoryTypes = new HashSet<Laboratory>();
            LaboratoryPassiveDefences = new HashSet<Laboratory>();
            LaboratoryResearchCenters = new HashSet<Laboratory>();
            LaboratoryStandardStatuses = new HashSet<Laboratory>();
            RequestServices = new HashSet<RequestService>();
            Requests = new HashSet<Request>();
            UserCities = new HashSet<User>();
            UserCountries = new HashSet<User>();
        }

        public int Id { get; set; }
        public int BaseTableTypeId { get; set; }
        public string Title { get; set; } = null!;

        public virtual BaseTableType BaseTableType { get; set; } = null!;
        public virtual ICollection<Department> Departments { get; set; }
        public virtual ICollection<Equipment> EquipmentCountries { get; set; }
        public virtual ICollection<Equipment> EquipmentEmploymentStatuses { get; set; }
        public virtual ICollection<Equipment> EquipmentEquipmentStatuses { get; set; }
        public virtual ICollection<Equipment> EquipmentEquipmentTypes { get; set; }
        public virtual ICollection<Equipment> EquipmentRelatedSections { get; set; }
        public virtual ICollection<Equipment> EquipmentSupplyTypes { get; set; }
        public virtual ICollection<Equipment> EquipmentUsageTypes { get; set; }
        public virtual ICollection<Laboratory> LaboratoryApprovalAuthorities { get; set; }
        public virtual ICollection<Laboratory> LaboratoryLaboratoryTypes { get; set; }
        public virtual ICollection<Laboratory> LaboratoryPassiveDefences { get; set; }
        public virtual ICollection<Laboratory> LaboratoryResearchCenters { get; set; }
        public virtual ICollection<Laboratory> LaboratoryStandardStatuses { get; set; }
        public virtual ICollection<RequestService> RequestServices { get; set; }
        public virtual ICollection<Request> Requests { get; set; }
        public virtual ICollection<User> UserCities { get; set; }
        public virtual ICollection<User> UserCountries { get; set; }
    }
}
