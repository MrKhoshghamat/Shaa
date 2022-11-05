public class AjaxFormResult
{
    public AjaxFormResult()
    {
    }

    public bool Success { get; set; }
    public object Data { get; set; }
    public List<ModelError> Errors { get; set; }
}

public class Success : AjaxFormResult
{
    public Success()
    {
        Success = true;
    }
}

public class HassError : AjaxFormResult
{
    public HassError()
    {
        Errors = new List<ModelError>();
        Success = false;
    }

    public HassError AddError(ModelError error)
    {
        Errors.Add(error);
        return this;
    }
}


public class ModelError
{
    public ModelError(string property, string message)
    {
        Property = property;
        Message = message; 
    }
    public string Property { get; set; }
    public string Message { get; set; }
}