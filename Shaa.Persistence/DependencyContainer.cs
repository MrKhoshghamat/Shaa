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

        #endregion

        #region Services

        services.AddScoped<IUserService, UserService>();
        services.AddScoped<IBaseInfoTypeService, BaseInfoTypeService>();

        #endregion
    }
}