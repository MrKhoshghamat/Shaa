namespace Shaa.Business.Statics;

public static class PathTools
{
    #region Image

    public static readonly string DefaultLabImage = "DefaultLabImage.png";

    public static readonly string DefaultLabServerPath =
        Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/content/lab/");

    public static readonly string DefaultLabPath = "/content/lab/";

    #endregion
    
    #region Site

    public static readonly string SiteAddress = "https://localhost:7255/";

    #endregion
}