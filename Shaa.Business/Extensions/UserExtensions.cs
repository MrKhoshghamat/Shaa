using System.Security.Claims;
using Shaa.Business.Generators;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;

namespace Shaa.Business.Extensions
{
    public static class UserExtensions
    {
        public static Guid GetUserId(this ClaimsPrincipal claimsPrincipal)
        {
            var identifier = claimsPrincipal.Claims.SingleOrDefault(s => s.Type == ClaimTypes.NameIdentifier);

            if (identifier == null) return CodeGenerator.CreateId();

            return Guid.Parse(identifier.Value);
        }

        public static string GetUserName(this User user)
        {
            if (!string.IsNullOrEmpty(user.FirstName) && !string.IsNullOrEmpty(user.LastName))
            {
                return $"{user.FirstName} {user.LastName}";
            }

            var email = user.Email.Split("@")[0];

            return email;
        }
    }
}
