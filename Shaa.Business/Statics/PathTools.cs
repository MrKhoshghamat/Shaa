namespace Shaa.Business.Statics;

public static class PathTools
{
    #region Image

    public static readonly string DefaultLabImage = "DefaultLabImage.png";

    public static readonly string DefaultLabServerPath =
        Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/content/lab/");

    public static readonly string DefaultLabPath = "/content/lab/";
    
    public static readonly string DefaultEquipmentImage = "DefaultequipmentImage.png";

    public static readonly string DefaultEquipmentServerPath =
        Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/content/equipment/");

    public static readonly string DefaultEquipmentPath = "/content/equipment/";

    #endregion
    
    #region Site

    public static readonly string SiteAddress = "https://localhost:7255/";

    #endregion
}