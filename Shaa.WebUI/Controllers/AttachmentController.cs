using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.ViewModels.Attachment;

namespace Shaa.WebUI.Controllers
{
    public class AttachmentController : Controller
    {
        #region Ctor

        private readonly IAttachmentService _attachmentService;

        public AttachmentController(IAttachmentService attachmentService)
        {
            _attachmentService = attachmentService;
        }

        #endregion
        //
        // public ActionResult AttachmentWindow(FilterAttachmentViewModel model)
        // {
        //     return PartialView(model);
        // }

        // [HttpPost]
        // public async Task<IActionResult> SaveAttachment(AttachmentViewModel model)
        // {
        //     if (!ModelState.IsValid)
        //         return Ok(new HassError() { Data = model }
        //             .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));
        //
        //     var result = await _attachmentService.RegisterAttachment(model);
        //
        //     switch (result)
        //     {
        //         case SaveAttachmentResult.WardExists:
        //             return Ok(new HassError() { Data = model }
        //                 .AddError(new ModelError("*", "بخشی با این عنوان قبلا ثبت شده است")));
        //         case SaveAttachmentResult.Success:
        //             return Ok(new Success() { Data = model });
        //     }
        //
        //     return BadRequest(model);
        // }
    }

}