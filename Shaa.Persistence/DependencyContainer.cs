using Microsoft.Extensions.DependencyInjection;
using Shaa.Business.Services.Implementations;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Repositories;
using Shaa.Domain.Repositories.Base;
using Shaa.Persistence.Repositories;

namespace Shaa.Persistence;

public static class DependencyContainer
{
    public static void RegisterDependency(IServiceCollection services)
    {
        #region Repositories

        services.AddScoped(typeof(IRepository<,>), typeof(Repository<,>));
        services.AddScoped<IBaseInfoTypeRepository, BaseInfoTypeRepository>();
        services.AddScoped<IUserRepository, UserRepository>();
        services.AddScoped<IBaseInfoRepository, BaseInfoRepository>();
        services.AddScoped<IEquipmentRepository, EquipmentRepository>();
        services.AddScoped<IAbilityRepository, AbilityRepository>();
        services.AddScoped<IMainInfoRepository, MainInfoRepository>();
        services.AddScoped<IWardRepository, WardRepository>();
        services.AddScoped<ILaboratoryRepository, LaboratoryRepository>();
        services.AddScoped<IEquipmentAbilityRepository, EquipmentAbilityRepository>();
        services.AddScoped<IRequestRepository, RequestRepository>();
        services.AddScoped<IRequestIndicatorRepository, RequestIndicatorRepository>();
        services.AddScoped<IRequestServiceRepository, RequestServiceRepository>();
        services.AddScoped<IAttachmentRepository, AttachmentRepository>();
        services.AddScoped<IRoleRepository, RoleRepository>();

        #endregion

        #region Services

        services.AddScoped<IUserService, UserService>();
        services.AddScoped<IBaseInfoTypeService, BaseInfoTypeService>();
        services.AddScoped<IBaseInfoService, BaseInfoService>();
        services.AddScoped<IRegisterLaboratoryService, RegisterLaboratoryService>();
        services.AddScoped<IWardService, WardService>();
        services.AddScoped<IEquipmentService, EquipmentService>();
        services.AddScoped<IAbilityService, AbilityService>();
        services.AddScoped<IRequestService, RequestService>();
        services.AddScoped<IRequestServiceService, RequestServiceService>();
        services.AddScoped<IAttachmentService, AttachmentService>();
        services.AddScoped<IAuthorizationService, AuthorizationService>();


        services.AddScoped<UserPermissionService>();

        #endregion
    }
}