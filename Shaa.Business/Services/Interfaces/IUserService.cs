using Shaa.Domain.Entities;
using Shaa.Domain.ViewModels;

namespace Shaa.Business.Services.Interfaces;

public interface IUserService
{
    #region Register

    Task<RegisterResult> RegisterUser(RegisterViewModel register);

    #endregion

    #region Login

    Task<LoginResult> CheckUserForLogin(LoginViewModel login);
    Task<User?> GetUserByNationalNo(string nationalNo);

    #endregion
}