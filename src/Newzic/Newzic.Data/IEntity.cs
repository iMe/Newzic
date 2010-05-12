using System;

namespace Newzic.Data
{
    public interface IEntity
    {
        Guid Id { get; set; }
    }
}