using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Generators;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.Attachment;

namespace Shaa.WebUI.Controllers
{
    public class AttachmentController : Controller
    {
        #region Ctor

        private readonly IAttachmentService _attachmentService;

        public AttachmentController(IAttachmentService attachmentService, IAttachmentRepository _attachmentRepository)
        {
            _attachmentService = new Shaa.Business.Services.Implementations.AttachmentService(_attachmentRepository);
        }

        #endregion
  
        [HttpPost]
        public async Task<IActionResult> ListTab(string entityName, string entityRecordId,int viewMode = 1)
        {
            var filterModel = new FilterAttachmentViewModel()
            {
                EntityName = entityName,
                EntityRecordId = entityRecordId
            };

            ViewBag.ViewMode = viewMode;

            return PartialView(filterModel);
        }
 
        [HttpPost]
        public async Task<IActionResult> ListData(FilterAttachmentViewModel model, int viewMode = 1)
        {
            var result = await _attachmentService.Filter(model);
            ViewBag.ViewMode = viewMode;
            return PartialView(result);
        }

        public ActionResult AttachmentWindow(FilterAttachmentViewModel model)
        {
            return PartialView(model);
        }

        [HttpPost]
        public async Task<IActionResult> SaveAttachment(AttachmentViewModel model, IFormFile attachmentFile)
        {
            /* if (!ModelState.IsValid)
                 return Ok(new HassError() { Data = model }
                     .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));*/

            // if (attachmentFile != null && attachmentFile.Length > 0)
            // var isAudioFile = true;//request.File.ContentType.ToLower().Contains("audio");
            //  var extension = Path.GetExtension(attachmentFile.FileName);

            byte[] bytes;
            model.FileName = attachmentFile.FileName;

            model.FileType = attachmentFile.ContentType;
            model.FileSize = attachmentFile.Length.ToString();
            model.Description = "";
            model.RegisterTime = DateTime.Now;
            // public Guid? UserId { get; set; }
            model.UniqueId = CodeGenerator.CreateId();

            using (var ms = new MemoryStream())
            {
                ms.Position = 0;
                attachmentFile.CopyTo(ms);
                bytes = ms.ToArray();
            }

            await _attachmentService.AddAttachment(model, bytes);

            //switch (result)
            //{
            //    case SaveAttachmentResult.WardExists:
            //        return Ok(new HassError() { Data = model }
            //            .AddError(new ModelError("*", "بخشی با این عنوان قبلا ثبت شده است")));
            //    case SaveAttachmentResult.Success:
            //        return Ok(new Success() { Data = model });
            //}

            return Ok(model);
        }

        [HttpPost]
        public async Task<IActionResult> DeleteAttachment(Guid uniqueId)
        {
            await _attachmentService.DeleteAttachment(uniqueId);
            return Ok(true);
        }

        [HttpGet]
        public async Task<IActionResult> DownloadAttachment(Guid Id)
        {
            var dbModel = await _attachmentService.GetAttachment(Id, true);
            return File(dbModel.AttachmentContent.FileContent, dbModel.FileType);
        }
    }

}