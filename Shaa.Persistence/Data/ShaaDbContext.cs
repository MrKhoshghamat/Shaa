using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Shaa.Domain.Entities;

namespace Shaa.Persistence.Data
{
    public partial class ShaaDbContext : DbContext
    {
        public ShaaDbContext()
        {
        }

        public ShaaDbContext(DbContextOptions<ShaaDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Ability> Abilities { get; set; } = null!;
        public virtual DbSet<Attachment> Attachments { get; set; } = null!;
        public virtual DbSet<AttachmentContent> AttachmentContents { get; set; } = null!;
        public virtual DbSet<BaseInfo> BaseInfos { get; set; } = null!;
        public virtual DbSet<BaseTableType> BaseTableTypes { get; set; } = null!;
        public virtual DbSet<Department> Departments { get; set; } = null!;
        public virtual DbSet<Equipment> Equipment { get; set; } = null!;
        public virtual DbSet<EquipmentAbility> EquipmentAbilities { get; set; } = null!;
        public virtual DbSet<Laboratory> Laboratories { get; set; } = null!;
        public virtual DbSet<Permission> Permissions { get; set; } = null!;
        public virtual DbSet<Request> Requests { get; set; } = null!;
        public virtual DbSet<RequestIndicator> RequestIndicators { get; set; } = null!;
        public virtual DbSet<RequestService> RequestServices { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<Ward> Wards { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        { 
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Ability>(entity =>
            {
                entity.ToTable("Ability", "Lab");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.DescriptionOfConsumables).HasMaxLength(1000);

                entity.Property(e => e.FileAttachment)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.FurtherDetailsAndProcedure).HasMaxLength(1000);

                entity.Property(e => e.ImplementationTime).HasColumnType("datetime");

                entity.HasOne(d => d.Laboratory)
                    .WithMany(p => p.Abilities)
                    .HasForeignKey(d => d.LaboratoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Ability_Laboratory");

                entity.HasOne(d => d.TitleNavigation)
                    .WithMany(p => p.Abilities)
                    .HasForeignKey(d => d.Title)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Ability_BaseInfo");
            });

            modelBuilder.Entity<Attachment>(entity =>
            {
                entity.ToTable("Attachment");

                entity.Property(e => e.DeletedDate).HasColumnType("datetime");

                entity.Property(e => e.Description)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.EntityName)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.EntityRecordId)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.FileName)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.FileSize)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.FileType)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.RegisterTime).HasColumnType("datetime");

                entity.Property(e => e.UniqueId).HasDefaultValueSql("(newid())");
            });

            modelBuilder.Entity<AttachmentContent>(entity =>
            {
                entity.ToTable("AttachmentContent");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.HasOne(d => d.IdNavigation)
                    .WithOne(p => p.AttachmentContent)
                    .HasForeignKey<AttachmentContent>(d => d.Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AttachmentContent_Attachment");
            });

            modelBuilder.Entity<BaseInfo>(entity =>
            {
                entity.ToTable("BaseInfo", "share");

                entity.Property(e => e.Title).HasMaxLength(255);

                entity.HasOne(d => d.BaseTableType)
                    .WithMany(p => p.BaseInfos)
                    .HasForeignKey(d => d.BaseTableTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BaseInfo_BaseTableType");
            });

            modelBuilder.Entity<BaseTableType>(entity =>
            {
                entity.ToTable("BaseTableType", "share");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Title).HasMaxLength(255);
            });

            modelBuilder.Entity<Department>(entity =>
            {
                entity.ToTable("Department", "organization");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Title).HasMaxLength(255);

                entity.HasOne(d => d.DepartmentType)
                    .WithMany(p => p.Departments)
                    .HasForeignKey(d => d.DepartmentTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Department_BaseInfo");

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId)
                    .HasConstraintName("FK_Department_Department");
            });

            modelBuilder.Entity<Equipment>(entity =>
            {
                entity.ToTable("Equipment", "Lab");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BaitulMalNo)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("Baitul-Mal No");

                entity.Property(e => e.CompanyName).HasMaxLength(255);

                entity.Property(e => e.EquipmentImage)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.EquipmentUsage).HasMaxLength(255);

                entity.Property(e => e.ExploitationDate).HasColumnType("datetime");

                entity.Property(e => e.GeneralTechnicalSpecification).HasMaxLength(255);

                entity.Property(e => e.InstallationDate).HasColumnType("datetime");

                entity.Property(e => e.InsuranceExpirationDate).HasColumnType("datetime");

                entity.Property(e => e.LastCalibrationDate).HasColumnType("datetime");

                entity.Property(e => e.Model)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.PersianTitle).HasMaxLength(255);

                entity.Property(e => e.PurchasePriceConstruction)
                    .HasMaxLength(50)
                    .HasColumnName("PurchasePrice/Construction");

                entity.Property(e => e.SerialNumber)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.SpecialCharacteristic).HasMaxLength(255);

                entity.Property(e => e.Title).HasMaxLength(255);

                entity.Property(e => e.TitlesAttachedToEquipment).HasMaxLength(255);

                entity.Property(e => e.WarrantyExpirationDate).HasColumnType("datetime");

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.EquipmentCountries)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK_Equipment_BaseInfo2");

                entity.HasOne(d => d.EmploymentStatus)
                    .WithMany(p => p.EquipmentEmploymentStatuses)
                    .HasForeignKey(d => d.EmploymentStatusId)
                    .HasConstraintName("FK_Equipment_BaseInfo6");

                entity.HasOne(d => d.EquipmentStatus)
                    .WithMany(p => p.EquipmentEquipmentStatuses)
                    .HasForeignKey(d => d.EquipmentStatusId)
                    .HasConstraintName("FK_Equipment_BaseInfo5");

                entity.HasOne(d => d.EquipmentType)
                    .WithMany(p => p.EquipmentEquipmentTypes)
                    .HasForeignKey(d => d.EquipmentTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Equipment_BaseInfo");

                entity.HasOne(d => d.Laboratory)
                    .WithMany(p => p.Equipment)
                    .HasForeignKey(d => d.LaboratoryId)
                    .HasConstraintName("FK_Equipment_Laboratory");

                entity.HasOne(d => d.RelatedSection)
                    .WithMany(p => p.EquipmentRelatedSections)
                    .HasForeignKey(d => d.RelatedSectionId)
                    .HasConstraintName("FK_Equipment_BaseInfo4");

                entity.HasOne(d => d.SupplyType)
                    .WithMany(p => p.EquipmentSupplyTypes)
                    .HasForeignKey(d => d.SupplyTypeId)
                    .HasConstraintName("FK_Equipment_BaseInfo3");

                entity.HasOne(d => d.UsageType)
                    .WithMany(p => p.EquipmentUsageTypes)
                    .HasForeignKey(d => d.UsageTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Equipment_BaseInfo1");

                entity.HasOne(d => d.Ward)
                    .WithMany(p => p.Equipment)
                    .HasForeignKey(d => d.WardId)
                    .HasConstraintName("FK_Equipment_Ward");
            });

            modelBuilder.Entity<EquipmentAbility>(entity =>
            {
                entity.ToTable("EquipmentAbility", "Lab");

                entity.HasOne(d => d.Ability)
                    .WithMany(p => p.EquipmentAbilities)
                    .HasForeignKey(d => d.AbilityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EquipmentAbility_Ability");

                entity.HasOne(d => d.Equipment)
                    .WithMany(p => p.EquipmentAbilities)
                    .HasForeignKey(d => d.EquipmentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EquipmentAbility_Equipment");
            });

            modelBuilder.Entity<Laboratory>(entity =>
            {
                entity.ToTable("Laboratory", "Lab");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Address).HasMaxLength(4000);

                entity.Property(e => e.Description).HasMaxLength(4000);

                entity.Property(e => e.ImagePath).HasMaxLength(1000);

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Title).HasMaxLength(255);

                entity.HasOne(d => d.ApprovalAuthority)
                    .WithMany(p => p.LaboratoryApprovalAuthorities)
                    .HasForeignKey(d => d.ApprovalAuthorityId)
                    .HasConstraintName("FK_Laboratory_BaseInfo2");

                entity.HasOne(d => d.LaboratoryType)
                    .WithMany(p => p.LaboratoryLaboratoryTypes)
                    .HasForeignKey(d => d.LaboratoryTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Laboratory_BaseInfo");

                entity.HasOne(d => d.PassiveDefence)
                    .WithMany(p => p.LaboratoryPassiveDefences)
                    .HasForeignKey(d => d.PassiveDefenceId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Laboratory_BaseInfo1");

                entity.HasOne(d => d.ResearchCenter)
                    .WithMany(p => p.LaboratoryResearchCenters)
                    .HasForeignKey(d => d.ResearchCenterId)
                    .HasConstraintName("FK_Laboratory_BaseInfo4");

                entity.HasOne(d => d.StandardStatus)
                    .WithMany(p => p.LaboratoryStandardStatuses)
                    .HasForeignKey(d => d.StandardStatusId)
                    .HasConstraintName("FK_Laboratory_BaseInfo3");
            });

            modelBuilder.Entity<Permission>(entity =>
            {
                entity.ToTable("Permission");

                entity.Property(e => e.Code).HasMaxLength(255);

                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.HasMany(d => d.Roles)
                    .WithMany(p => p.Permissions)
                    .UsingEntity<Dictionary<string, object>>(
                        "RolePermission",
                        l => l.HasOne<Role>().WithMany().HasForeignKey("RoleId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_RolePermission_Role"),
                        r => r.HasOne<Permission>().WithMany().HasForeignKey("PermissionId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_RolePermission_Permission"),
                        j =>
                        {
                            j.HasKey("PermissionId", "RoleId");

                            j.ToTable("RolePermission");
                        });
            });

            modelBuilder.Entity<Request>(entity =>
            {
                entity.ToTable("Request", "Lab");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.IndicatorNo).HasMaxLength(255);

                entity.Property(e => e.LetterPath)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.RequestDate).HasColumnType("datetime");

                entity.Property(e => e.Title).HasMaxLength(255);

                entity.Property(e => e.TraceCode).HasMaxLength(255);

                entity.Property(e => e.UserName).HasMaxLength(255);

                entity.HasOne(d => d.Laboratory)
                    .WithMany(p => p.Requests)
                    .HasForeignKey(d => d.LaboratoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Request_Laboratory");

                entity.HasOne(d => d.RequestAttachment)
                    .WithMany(p => p.Requests)
                    .HasForeignKey(d => d.RequestAttachmentId)
                    .HasConstraintName("FK_Request_Attachment1");

                entity.HasOne(d => d.RequestType)
                    .WithMany(p => p.Requests)
                    .HasForeignKey(d => d.RequestTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Request_BaseInfo");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Requests)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Request_User");
            });

            modelBuilder.Entity<RequestIndicator>(entity =>
            {
                entity.ToTable("RequestIndicator", "Lab");

                entity.Property(e => e.IndicatorNo).HasMaxLength(255);

                entity.Property(e => e.TraceCode).HasMaxLength(255);

                entity.HasOne(d => d.Request)
                    .WithMany(p => p.RequestIndicators)
                    .HasForeignKey(d => d.RequestId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RequestIndicator_Request");
            });

            modelBuilder.Entity<RequestService>(entity =>
            {
                entity.ToTable("RequestService", "Lab");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.SampleTitle).HasMaxLength(255);

                entity.HasOne(d => d.Request)
                    .WithMany(p => p.RequestServices)
                    .HasForeignKey(d => d.RequestId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RequestService_Request");

                entity.HasOne(d => d.Service)
                    .WithMany(p => p.RequestServices)
                    .HasForeignKey(d => d.ServiceId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RequestService_BaseInfo");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Title).HasMaxLength(255);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BirthDate).HasColumnType("datetime");

                entity.Property(e => e.CreationDate).HasColumnType("datetime");

                entity.Property(e => e.Description).HasMaxLength(4000);

                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.EmailActivationCode)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName).HasMaxLength(50);

                entity.Property(e => e.LastName).HasMaxLength(50);

                entity.Property(e => e.NationalNo).HasMaxLength(50);

                entity.Property(e => e.Password)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(11)
                    .IsUnicode(false);

                entity.HasOne(d => d.City)
                    .WithMany(p => p.UserCities)
                    .HasForeignKey(d => d.CityId)
                    .HasConstraintName("FK_User_BaseInfo1");

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.UserCountries)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK_User_BaseInfo");

                entity.HasOne(d => d.Department)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.DepartmentId)
                    .HasConstraintName("FK_User_Department");

                entity.HasMany(d => d.Roles)
                    .WithMany(p => p.Users)
                    .UsingEntity<Dictionary<string, object>>(
                        "UserRole",
                        l => l.HasOne<Role>().WithMany().HasForeignKey("RoleId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_UserRole_Role"),
                        r => r.HasOne<User>().WithMany().HasForeignKey("UserId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_UserRole_User"),
                        j =>
                        {
                            j.HasKey("UserId", "RoleId");

                            j.ToTable("UserRole");
                        });
            });

            modelBuilder.Entity<Ward>(entity =>
            {
                entity.ToTable("Ward", "Lab");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Title).HasMaxLength(255);

                entity.HasOne(d => d.Laboratory)
                    .WithMany(p => p.Wards)
                    .HasForeignKey(d => d.LaboratoryId)
                    .HasConstraintName("FK_Ward_Laboratory");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
