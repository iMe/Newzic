using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newzic.Core;
using Newzic.Website.Models;

namespace Newzic.Website.Controllers
{
    public class NewsController : Controller
    {
        private IDataCRUD<Noticia> repNoticias = new DataCRUD<Noticia>();
        //
        // GET: /Noticia/

        public ActionResult Index()
        {
            DataCRUD<Noticia> obter = new DataCRUD<Noticia>();
            var noticias = obter.fetchAll();
            return View(noticias);

        }

        public ActionResult ApagarNoticia(string id)
        {


            var gid = new Guid(id);
            var noticia = repNoticias.fetchAll().Single(n => n.NoticiaId == gid);

            return View("ConfirmaApagarNoticia", noticia);

        }

        public ActionResult ConfirmaApagarNoticia(string id, string user)
        {
            if (!Request.IsAuthenticated) return View("AcessoNegado");

            var gid = new Guid(id);
            var noticia = repNoticias.fetchAll().Single(n => n.NoticiaId == gid);
            
            if(AdminController.getRole(user).Equals("Administrador"))
            {
                podeApagar(noticia);
                return View("SuccessView");
            }
            
            if(AdminController.getRole(user).Equals("Moderador"))
            {
                if (!AdminController.getRole(noticia.Jornalista.Email).Equals("Moderador"))
                {
                    podeApagar(noticia);
                    return View("SuccessView");
                }
                return View("Error");
            }
                
            if(noticia.Jornalista.Email.Equals(user))
            {
                podeApagar(noticia);
                return View("SuccessView");
            }
            return View("Error");
                
        }

        private void podeApagar(Noticia noticia)
        {
            
            //noticia.NoticiaFlaggeds.Clear();
            repNoticias.remove(noticia);
            repNoticias.Save();
        }

        //
        // GET: /Noticia/Details/5

        public ActionResult Details(string id)
        {
            NewsDetailsModel model = buildModel(id);
            
            var array = model.noticia.Imagems.Select(i => "\"" + i.ImagemId.ToString() + "\"").ToArray();
            ViewData["PicIds"] = "window.picIds = [" + string.Join(",", array) + "];";

            var arrayPontos = model.noticia.Mapas.Select(m => "{ point: new GLatLng(" + m.Latitude + "," + m.Longitude + "), text: '" + m.Morada +"' }").ToArray();
            ViewData["MapPoints"] = "window.MapPoints = [" + string.Join(",", arrayPontos) + "];";

            //var s = model.noticia.Corpo.Split('.');
            //model.noticia.Corpo = "";
            //foreach (string ss in s)
            //{
            //    model.noticia.Corpo = model.noticia.Corpo + '.' + '\n' + ss;
            //})
            return View("Show",model);
        }

        public ActionResult Comentario(NewsDetailsModel model)
        {
            if (!Request.IsAuthenticated) return View("AcessoNegado");
            string email = User.Identity.Name;
            
            IDataCRUD<Jornalista> dbj = new DataCRUD<Jornalista>();
            IDataCRUD<Comentario> dbc = new DataCRUD<Comentario>();

            Jornalista jorn = (from Jornalista j in dbj.fetchAll() where j.Email.Equals(email) select j).Single();

            var s = model.comentario.Split('\r');
            String res = "";
            foreach (String ss in s)
            {
                res = res + ss;
            }

            Comentario c = new Comentario();
            c.Texto = res;
            c.JornalistaId = jorn.JornalistaId;
            //String s = ViewData["noticiaid"].ToString();
            c.NoticiaId = new Guid(model.guid);//model.noticia.NoticiaId;

            dbc.create(c);
            dbc.Save();
            dbc.Dispose();

            model = buildModel(model.guid);
            model.comentario = "";
            //if (model.comments==null) model.comments=new List<Comentario>();
            //model.comments.Add(c);
            return View("Show", model);
        }

        public ActionResult UpVote(string id)
        {
            if (!Request.IsAuthenticated) return View("AcessoNegado");

            IDataCRUD<Noticia> dbn = new DataCRUD<Noticia>();
            IDataCRUD<Jornalista> dbj = new DataCRUD<Jornalista>();

            Noticia noticia = (from Noticia n in dbn.fetchAll() where n.NoticiaId.ToString().Equals(id) select n).Single();
            Jornalista jorn = (from Jornalista j in dbj.fetchAll() where j.Email.Equals(User.Identity.Name) select j).Single();
            var votos = noticia.VotoNoticias;
            Boolean b = votos.Any(vn => vn.JornalistaId == jorn.JornalistaId);//(from VotoNoticia vn in votos where vn.JornalistaId==jorn.JornalistaId select vn).Any();
            

            if (!b)
            {
                VotoNoticia voto = new VotoNoticia();
                voto.JornalistaId = jorn.JornalistaId;
                voto.NoticiaId = noticia.NoticiaId;
                noticia.VotoNoticias.Add(voto);
                noticia.Pontuacao++;

                dbn.Save();
                dbn.Dispose();
            }

            NewsDetailsModel model = buildModel(id);
            
            return View("Show", model);
        }

        public ActionResult DownVote(string id)
        {
            if (!Request.IsAuthenticated) return View("AcessoNegado");

            IDataCRUD<Noticia> dbn = new DataCRUD<Noticia>();
            IDataCRUD<Jornalista> dbj = new DataCRUD<Jornalista>();

            Noticia noticia = (from Noticia n in dbn.fetchAll() where n.NoticiaId.ToString().Equals(id) select n).Single();
            Jornalista jorn = (from Jornalista j in dbj.fetchAll() where j.Email.Equals(User.Identity.Name) select j).Single();
            var votos = noticia.VotoNoticias;
            Boolean b = votos.Any(vn => vn.JornalistaId == jorn.JornalistaId);//(from VotoNoticia vn in votos where vn.JornalistaId==jorn.JornalistaId select vn).Any();


            if (!b)
            {
                VotoNoticia voto = new VotoNoticia();
                voto.JornalistaId = jorn.JornalistaId;
                voto.NoticiaId = noticia.NoticiaId;
                noticia.VotoNoticias.Add(voto);
                noticia.Pontuacao--;

                dbn.Save();
                dbn.Dispose();
            }

            NewsDetailsModel model = buildModel(id);

            return View("Show", model);
        }

        public ActionResult getImage(String id)
        {
            IDataCRUD<Imagem> dbi = new DataCRUD<Imagem>();
            byte[] res = dbi.fetchAll().Single(i => i.ImagemId.ToString().Equals(id)).ImageFile.ToArray();
            return new FileContentResult(res, "image/jpeg");
        }

        public NewsDetailsModel buildModel(string id)
        {
            NewsDetailsModel model = new NewsDetailsModel();
            IDataCRUD<Noticia> db = new DataCRUD<Noticia>();
            IDataCRUD<Comentario> dbc =new DataCRUD<Comentario>();

            model.comments = (from Comentario c in dbc.fetchAll() where c.NoticiaId.ToString().Equals(id) select c).ToList();
            model.noticia = (from Noticia n in db.fetchAll() where n.NoticiaId.ToString().Equals(id) select n).Single();
            //model.comments = null;
            model.comentario = null;
            model.guid = model.noticia.NoticiaId.ToString();
            
            return model;
        }
        //
        // GET: /Noticia/Create

        public ActionResult Create()
        {
            return View();
        }

        public ActionResult AddVideo ()
        {
            var nameValueCollection = Request.Form;
            return View();
        }

        public void addMapaPoint (float longitude, float latitude, string localidade)
        {
            



        }

        public bool camposNoticiaInvalidos (Noticia noticia)
        {
            bool erroPrenchimento = false;
            if (string.IsNullOrWhiteSpace(noticia.Titulo))
            {
                ModelState.AddModelError("Titulo", "Preenchimento obrigatório");
                erroPrenchimento = true;
            }
            if (string.IsNullOrWhiteSpace(noticia.Corpo))
            {
                ModelState.AddModelError("Corpo", "Preenchimento obrigatório");
                erroPrenchimento = true;
            }
            if (string.IsNullOrWhiteSpace(noticia.Tags))
            {
                ModelState.AddModelError("Tags", "Preenchimento obrigatório");
                erroPrenchimento = true;
            }
            return erroPrenchimento;
        }
        
        //
        // POST: /Noticia/Create

        [HttpPost]
        public ActionResult Create(Noticia noticia)
        {
            var isAuthenticated = Request.IsAuthenticated;
            if (isAuthenticated == true)
            {
                if (ModelState.IsValid)
                {
                   
                    if (camposNoticiaInvalidos(noticia) == true)
                        return View(noticia);
                    try
                    {
                        
                        foreach (string file in Request.Files)
                        {
                            HttpPostedFileBase hpf = Request.Files[file] as HttpPostedFileBase;
                            var fileSize = hpf.ContentLength;
                            if (fileSize == 0)
                                continue;

                            Imagem img = new Imagem();
                            byte[] buffer = new byte[fileSize];
                            hpf.InputStream.Read(buffer, 0, fileSize);
                            img.ImageFile = buffer;
                            noticia.Imagems.Add(img);

                        }
                        
                        string listaVideos = noticia.listaVideos;
                        string[] arrayVideos = listaVideos.Split('\n');
                        
                         //Adição dos links youtube.
                        
                        
                        
                        var email = User.Identity.Name;
                        IDataCRUD<Jornalista> jornalistaConsulta = new DataCRUD<Jornalista>();
                        IQueryable<Jornalista> jornalistas = jornalistaConsulta.fetchAll();
                        Jornalista jorn =
                            (from Jornalista j in jornalistas where j.Email.Equals(email) select j).Single();
                        var jornalistaId = jorn.JornalistaId;
                        noticia.Data = DateTime.Now;
                        noticia.JornalistaId = jornalistaId;
                        IDataCRUD<Noticia> noticiaAdd = new DataCRUD<Noticia>();
                        Guid id = noticiaAdd.create(noticia);
                        noticiaAdd.Save();
                        IDataCRUD<Video> videoAdd = new DataCRUD<Video>();
                        for (int i = 0; i < arrayVideos.Length; i++)
                        {
                            var novoVideo = new Video();
                            string url = arrayVideos[i];
                            novoVideo.Url = url;
                            novoVideo.NoticiaId = id;
                            Guid idVideo = videoAdd.create(novoVideo);
                            videoAdd.Save();
                        }
                        return RedirectToAction("Index");
                    }
                    catch
                    {
                        return View(noticia);
                    }
                }
                else
                {
                    return View(noticia);
                }
            }
            else
            {
                return RedirectToAction("Index");
            }
        }

        //
        // GET: /Noticia/Edit/5

        public ActionResult Edit(Guid id)
        {

            IDataCRUD<Noticia> editaNew = new DataCRUD<Noticia>();
            var dados = editaNew.fetchAll();
            Noticia bla = (dados.SingleOrDefault(n => n.NoticiaId.Equals(id)));
            return View(bla);
        }

        //
        // POST: /Noticia/Edit/5

        [HttpPost]
        public ActionResult Edit(Guid id, Noticia noticia)
        {
            IDataCRUD<Noticia> editaNew = new DataCRUD<Noticia>();
            var dados = editaNew.fetchAll();
            Noticia bla = (dados.SingleOrDefault(n => n.NoticiaId.Equals(id)));
            if (camposNoticiaInvalidos(noticia) == true)
                return View (noticia);
            try
            {
                string dataEditado = ("\r\nEditado (" + DateTime.Now.ToString() + ")");
                noticia.Corpo = noticia.Corpo + dataEditado;
                bla.setObjecto(noticia);
                editaNew.update(bla);
                editaNew.Save();
                return RedirectToAction("Index");
            }
            catch
            {
                return View(bla);
            }
        }
    }
}
