namespace Shaa.Business.Generators;

public static class CodeGenerator
{
    public static string CreateActivationCode()
    {
        return Guid.NewGuid().ToString("N");
    }

    public static Guid CreateId()
    {
        return Guid.NewGuid();
    }
}