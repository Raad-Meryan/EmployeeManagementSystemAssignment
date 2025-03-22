using EmpAssignment.DTOs;

namespace EmpAssignment.Services
{
    public interface IEmpService
    {
        Task<IEnumerable<EmpDetailsDto>> GetEmpAsync();
        Task<string> AddEmpAsync(EmpDto empDto);
        Task<string> UpdateEmpAsync(UpdateEmpDto empDto);
        Task<string> DeleteEmpAsync(int EmpId);
        Task<IEnumerable<EmpSalaries>> ViewTopSalaries();
        Task<IEnumerable<EmpExperience>> ViewTopExperience();
    }
}
