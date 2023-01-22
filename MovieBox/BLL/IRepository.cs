using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public interface IRepository<T>
    {
        List<T> GetAll();
        T GetById(int id);
        void insert(T item);
        void update(T item);
        void delete(int itemid);
    }
}
