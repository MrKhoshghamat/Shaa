using Shaa.Business.Generators;
using Shaa.Business.Security;
using Shaa.Business.Services.Interfaces;
using Shaa.Business.Statics;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels;
using Shaa.Domain.ViewModels.Authorization;

namespace Shaa.Business.Services.Implementations;

public class UserService : IUserService
{
    #region Ctor

    private readonly IUserRepository _userRepository;

    public UserService(IUserRepository userRepository)
    {
        _userRepository = userRepository;
    }

    #endregion

    #region Register

    public async Task<RegisterResult> RegisterUser(RegisterViewModel register)
    {
        if (await _userRepository.IsExistByNationalNo(register.NationalNo))
            return RegisterResult.UserExists;

        var password = PasswordHelper.EncodePasswordMd5(register.Password.SanitizeText().ToLower());

        var user = new User()
        {
            Id = CodeGenerator.CreateId(),
            FirstName = register.FirstName,
            LastName = register.LastName,
            NationalNo = register.NationalNo,
            Password = password,
            EmailActivationCode = CodeGenerator.CreateActivationCode()
        };

        await _userRepository.AddAsync(user);

        return RegisterResult.Success;
    }


    #endregion

    #region Login

    public async Task<LoginResult> CheckUserForLogin(LoginViewModel login)
    {
        var user = await _userRepository.GetUserByNationNo(login.NationalNo);

        if (user.Equals(null))
            return LoginResult.UserNotFound;

        var hashedPassword = PasswordHelper.EncodePasswordMd5(login.Password.SanitizeText().ToLower());

        if (hashedPassword != user.Password) return LoginResult.UserNotFound;

        if (user.IsBanned) return LoginResult.UserIsBanned;

        return LoginResult.Success;
    }

    public async Task<User?> GetUserByNationalNo(string nationalNo)
    {
        return await _userRepository.GetUserByNationNo(nationalNo);
    }


    #endregion
    public async Task<FilterUserRoleViewModel> Filter(FilterUserRoleViewModel filter)
    {
        var query = await _userRepository.GetAllUsers();

        //if (!string.IsNullOrEmpty(filter.Title))
        //{
        //    query = query.Where(p => p.Title.Contains(filter.Title.SanitizeText().Trim()));
        //}

        //switch (filter.Sort)
        //{
        //    case FilterEnum.AlphabeticASC:
        //        query = query.OrderBy(p => p.Title);
        //        break;
        //    case FilterEnum.AlphabeticDESC:
        //        query = query.OrderByDescending(p => p.Title);
        //        break;
        //}

        var result = query
            .Select(s => new UserRoleViewModel()
            {
                UserId = s.Id,
                UserName = s.FirstName + " " + s.LastName,
                //PermissionId = s.Roles,
                //PermissionName = ,
            }).OrderBy(p => p.UserId).AsQueryable();
 
        await filter.SetPaging(result);
 
        return filter;
    }
}