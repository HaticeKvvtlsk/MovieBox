using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Repositories
{
    public class KategoriRepository : IRepository<Kategoriler>
    {
        MovieBoxDBEntities db = new MovieBoxDBEntities();
        public void delete(int itemid)
        {
            throw new NotImplementedException();
        }

        public List<Kategoriler> GetAll()
        {
            return db.Kategoriler.ToList();
        }

        public Kategoriler GetById(int id)
        {
            throw new NotImplementedException();
        }

        public void insert(Kategoriler item)
        {
            throw new NotImplementedException();
        }

        public void update(Kategoriler item)
        {
            throw new NotImplementedException();
        }
    }
}
