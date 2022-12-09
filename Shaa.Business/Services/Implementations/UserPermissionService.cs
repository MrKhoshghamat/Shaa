using Microsoft.Extensions.Caching.Memory;
using Shaa.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shaa.Business.Services.Implementations
{
    public class PermissionModel
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
    }

    public class UserPermissionService
    {
        private readonly IMemoryCache _memoryCache;
        private readonly IUserRepository _userRepository;
        public UserPermissionService(IMemoryCache memoryCache, IUserRepository userRepository)
        {
            _memoryCache = memoryCache;
            _userRepository = userRepository;
        }

        public List<PermissionModel> GetUserPermission(Guid userId)
        {
            if (!_memoryCache.TryGetValue($"UserPermission_{userId.ToString("N")}", out List<PermissionModel> cacheValue))
            {
                var user = _userRepository.GetUserWithRolePermissionById(userId);

                cacheValue = user.Roles.SelectMany(p => p.Permissions)
                    .Select(p => new PermissionModel() { Id = p.Id, Code = p.Code, Description = p.Description }).ToList();

                var cacheEntryOptions = new MemoryCacheEntryOptions()
                    .SetSlidingExpiration(TimeSpan.FromMinutes(30));

                _memoryCache.Set($"UserPermission_{userId.ToString("N")}", cacheValue, cacheEntryOptions);
            }

            return cacheValue;
        }
    }


}
