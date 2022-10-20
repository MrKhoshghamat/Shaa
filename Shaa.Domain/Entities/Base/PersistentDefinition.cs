using Shaa.Domain.Entities.Base;

namespace Shaa.Domain.Entities
{
    public partial class Ability : IIdentityObject<Guid> { }
    public partial class Department : IIdentityObject<Guid> { }
    public partial class Equipment : IIdentityObject<Guid> { }
    public partial class Laboratory : IIdentityObject<Guid> { }
    public partial class Ward : IIdentityObject<Guid> { }
    public partial class User : IIdentityObject<Guid> { }
}
