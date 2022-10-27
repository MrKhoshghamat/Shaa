﻿using Shaa.Domain.Entities;
using Shaa.Domain.ViewModels;

namespace Shaa.Business.Services.Interfaces;

public interface IEquipmentService
{
    Task<LaboratoryResult> RegisterEquipment(LaboratoryViewModel laboratory);
}