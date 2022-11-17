using System.Globalization;
using Shaa.Business.Extensions;

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

    public static string CreateRequestNo()
    {
        var randomGenerator = new Random();
        var requestNo = randomGenerator.Next(00000, 99999).ToString("D5");
        return requestNo;
    }
    
    public static string CreateRequestTraceCode(string requestNo)
    {
        var persianCalendar = new PersianCalendar();

        var year = $"{persianCalendar.GetYear(DateTime.Now)}";
        var month = $"{persianCalendar.GetMonth(DateTime.Now).ToString("D2")}";
        var day = $"{persianCalendar.GetDayOfMonth(DateTime.Now).ToString("D2")}";

        var traceCode = $"{year}{month}{day}{requestNo}";

        return traceCode;
    }
}