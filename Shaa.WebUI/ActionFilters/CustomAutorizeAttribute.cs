using Microsoft.AspNetCore.Mvc.Filters;
using Shaa.Business.Extensions;
using Shaa.Business.Services.Implementations;

namespace Shaa.WebUI.ActionFilters
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class CustomAutorizeAttribute : ActionFilterAttribute
    {
        private readonly string _permissionCode; 

        public CustomAutorizeAttribute(string permissionCode)
        {
            _permissionCode = permissionCode; 
        }
         
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            var svc = context.HttpContext.RequestServices;
            var userPermissionService = svc.GetService<UserPermissionService>();

            var userId = context.HttpContext.User.GetUserId();
            var permissions = userPermissionService.GetUserPermission(userId);

            if (!permissions.Any(p => p.Code == _permissionCode))
            {
                context.HttpContext.Response.StatusCode = 403;
            }
        }
    }
}
