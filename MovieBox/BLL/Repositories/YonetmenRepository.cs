using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Repositories
{
    public class YonetmenRepository : IRepository<Yonetmenler>
    {
        MovieBoxDBEntities db = new MovieBoxDBEntities();
        public void delete(int itemid)
        {
            throw new NotImplementedException();
        }

        public List<Yonetmenler> GetAll()
        {
            return db.Yonetmenler.ToList();
        }

        public Yonetmenler GetById(int id)
        {
            throw new NotImplementedException();
        }

        public void insert(Yonetmenler item)
        {
            throw new NotImplementedException();
        }

        public void update(Yonetmenler item)
        {
            throw new NotImplementedException();
        }
    }
}
