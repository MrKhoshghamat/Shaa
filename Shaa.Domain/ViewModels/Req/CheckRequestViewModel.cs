﻿using System.ComponentModel.DataAnnotations;
using Shaa.Domain.Entities;
using Shaa.Domain.ViewModels.BasicInfo;

namespace Shaa.Domain.ViewModels.Req;

public class CheckRequestViewModel
{
    public Guid? Id { get; set; }
    public Guid? LaboratoryId { get; set; }
    public string? LaboratoryTitle { get; set; }
    public string? UserName { get; set; }

    public Guid? UserId { get; set; }

    [RegularExpression(@"^\d{4}/((0[1-9])|(1[012]))/((0[1-9]|[12]\d)|3[01])$",
        ErrorMessage = "تاریخ وارد شده معتبر نمیباشد")]
    public string? RequestDate { get; set; }

    public string? Title { get; set; }
    public string? Description { get; set; }
    public string? DescForCheck { get; set; }
    public int RequestTypeId { get; set; }
    public string? LetterPath { get; set; }
    public string? TraceCode { get; set; }
    public string? IndicatorNo { get; set; }
    public Guid? RequestAttachmentUniqueId { get; set; }
    public User? User { get; set; }

    public FilterRequestServiceViewModel FilterRequestServiceViewModel { get; set; }

}