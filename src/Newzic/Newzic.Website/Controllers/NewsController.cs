using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Linq;
using System.Drawing;
using System.Drawing.Imaging;
using System.Globalization;
using System.IO;
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
            
            //var array = model.noticia.Imagems.Select(i => "\"" + i.ImagemId.ToString() + "\"").ToArray();
            //ViewData["PicIds"] = "window.picIds = [" + string.Join(",", array) + "];";

            //var arrayPontos = model.noticia.Mapas.Select(m => "{ point: new GLatLng(" + m.Latitude + "," + m.Longitude + "), text: '" + m.Morada +"' }").ToArray();

            //ViewData["MapPoints"] = "window.MapPoints = [" + string.Join(",", arrayPontos) + "];";


            return View("Show",model);
        }

        public ActionResult Comentario(NewsDetailsModel model)
        {
            if (model.comentario == null) { return RedirectToAction("Index", "Home"); }

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
            c.Data = DateTime.Now;
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
            String tipo = dbi.fetchAll().Single(ii => ii.ImagemId.ToString().Equals(id)).Tipo;
            byte[] res = dbi.fetchAll().Single(i => i.ImagemId.ToString().Equals(id)).ImageFile.ToArray();
            return new FileContentResult(res, "image/"+tipo);
        }

        public ActionResult getImagePreview(String id)
        {
            byte[] res = System.IO.File.ReadAllBytes(@"C:\Temp\" + id);
            String[] s = id.Split('.');
            return new FileContentResult(res, "image/" + s[1]);
        }

        public NewsDetailsModel buildModel(string id)
        {
            NewsDetailsModel model = new NewsDetailsModel();
            IDataCRUD<Noticia> db = new DataCRUD<Noticia>();
            IDataCRUD<Comentario> dbc =new DataCRUD<Comentario>();

            model.comments = (from Comentario c in dbc.fetchAll() where c.NoticiaId.ToString().Equals(id) orderby c.Data select c).ToList();
            //model.comments=model.comments.OrderBy(c => c.Data);
            model.noticia = (from Noticia n in db.fetchAll() where n.NoticiaId.ToString().Equals(id) select n).Single();
            model.comentario = null;
            model.guid = model.noticia.NoticiaId.ToString();

            var array = model.noticia.Imagems.Select(i => "\"" + i.ImagemId.ToString() + "\"").ToArray();
            ViewData["PicIds"] = "window.picIds = [" + string.Join(",", array) + "];";

            var arrayPontos = model.noticia.Mapas.Select(m => "{ point: new GLatLng(" + m.Latitude + "," + m.Longitude + "), text: '" + m.Morada + "' }").ToArray();
            if (arrayPontos.Length == 0) model.hasMap = false;
            else{
                ViewData["MapPoints"] = "window.MapPoints = [" + string.Join(",", arrayPontos) + "];";
                model.hasMap = true;
            }

            return model;
        }

        public ActionResult Preview(Noticia noticia)
        {
            if (!Request.IsAuthenticated) return View("AcessoNegado");
            if (noticia == null) return View("AcessoNegado");

            IDataCRUD<Jornalista> jornalistas = new DataCRUD<Jornalista>();
            Jornalista jorn =(from Jornalista j in jornalistas.fetchAll() where j.Email.Equals(User.Identity.Name) select j).Single();

            noticia.Data = DateTime.Now;
            noticia.JornalistaId = jorn.JornalistaId;

            var stringVideos = Request.Form["stringListaVideos"];
            string[] arrayVideos = stringVideos.Split(';');

            for (int i = 0; i < arrayVideos.Length; i++)
            {
                var novoVideo = new Video();
                string url = arrayVideos[i];
                if (linkVideoValido(url) == true)
                {
                    novoVideo.Url = url;
                    noticia.Videos.Add(novoVideo);
                }
            }

            var stringMarcos = Request.Form["stringComMarcos"];
            string[] arrayMarcos = stringMarcos.Split('§');
            
            for (int i = 0; (i + 4) < arrayMarcos.Length; i += 4)
            {
                // Falta resolver o problema do parse, ele nao ta a parsar bem o decimal!
                //arrayMarcos[i] = arrayMarcos[i].Replace('.', ',');
                //arrayMarcos[i + 1] = arrayMarcos[i + 1].Replace('.', ',');
                double latitude = double.Parse(arrayMarcos[i], NumberStyles.Any);
                double longitude = double.Parse(arrayMarcos[i + 1], NumberStyles.Any);
                string titulo = arrayMarcos[i + 2];
                string corpo = arrayMarcos[i + 3];
                Mapa novoMapa = new Mapa();
                novoMapa.Latitude = (float)latitude;
                novoMapa.Longitude = (float)longitude;
                novoMapa.Morada = titulo + "§" + corpo;
                noticia.Mapas.Add(novoMapa);
            }


            //var teste = Request.Files;

            foreach (string file in Request.Files)
            {

                HttpPostedFileBase hpf = Request.Files[file] as HttpPostedFileBase;
                var fileSize = hpf.ContentLength;
                if (fileSize == 0)
                    continue;

                Imagem novaImagem = new Imagem();
                if (Path.GetExtension(hpf.FileName).Length == 0)
                {
                    throw new Exception(string.Format("File '{0}' has no extension (e.g. .jpeg .png)", hpf.FileName));
                }
                byte[] buffer = new byte[fileSize];
                hpf.InputStream.Read(buffer, 0, fileSize);
                novaImagem.Tipo = Path.GetExtension(hpf.FileName);
                novaImagem.Nome = hpf.FileName;

                TypeConverter tc = TypeDescriptor.GetConverter(typeof(Bitmap));
                Bitmap img = (Bitmap)tc.ConvertFrom(buffer);
                img.Save(@"C:\Temp\" + novaImagem.Nome + "." + novaImagem.Tipo);

                noticia.Imagems.Add(novaImagem);
            }


            var array = noticia.Imagems.Select(i => "\"" + i.Nome + "." + i.Tipo + "\"").ToArray();
            ViewData["PicIds"] = "window.picIds = [" + string.Join(",", array) + "];";

            if (noticia.Mapas.Count > 0)
            {
                var arrayPontos = noticia.Mapas.Select(m => "{ point: new GLatLng(" + m.Latitude + "," + m.Longitude + "), text: '" + m.Morada + "' }").ToArray();
                ViewData["MapPoints"] = "window.MapPoints = [" + string.Join(",", arrayPontos) + "];";
            }
            
            //noticia = n;

            //if (noticia == null) { return RedirectToAction("Index", "Home"); }
            
            //foreach (Imagem imagem in noticia.Imagems)
            //{
            //    TypeConverter tc = TypeDescriptor.GetConverter(typeof(Bitmap));
            //    Bitmap img = (Bitmap)tc.ConvertFrom(imagem.ImageFile.ToArray());

            //    img.Save(@"C:\Temp\" + imagem.Nome+"."+imagem.Tipo);
            //}


            //var array = noticia.Imagems.Select(i => "\"" + i.Nome + "." +i.Tipo +"\"").ToArray();
            //ViewData["PicIds"] = "window.picIds = [" + string.Join(",", array) + "];";

            //if(noticia.Mapas.Count>0){
            //    var arrayPontos = noticia.Mapas.Select(m => "{ point: new GLatLng(" + m.Latitude + "," + m.Longitude + "), text: '" + m.Morada + "' }").ToArray();
            //    ViewData["MapPoints"] = "window.MapPoints = [" + string.Join(",", arrayPontos) + "];";
            //}

            return View("Preview", noticia);
        }




        //
        // GET: /Noticia/Create

        public ActionResult Create()
        {
            if (!Request.IsAuthenticated) return View("AcessoNegado");
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

        private bool linkVideoValido(string url)
        {
            if (url.Equals(""))
                return false;
            else
            {
                return true;
            }
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



                        var email = User.Identity.Name;
                        IDataCRUD<Jornalista> jornalistaConsulta = new DataCRUD<Jornalista>();
                        IQueryable<Jornalista> jornalistas = jornalistaConsulta.fetchAll();
                        Jornalista jorn =
                            (from Jornalista j in jornalistas where j.Email.Equals(email) select j).Single();
                        var jornalistaId = jorn.JornalistaId;
                        noticia.Data = DateTime.Now;
                        noticia.JornalistaId = jornalistaId;
                        IDataCRUD<Noticia> noticiaAdd = new DataCRUD<Noticia>();
                        Guid idNoticia = noticiaAdd.create(noticia);
                        noticiaAdd.Save();
                        IDataCRUD<Video> videoAdd = new DataCRUD<Video>();

                        var stringVideos = Request.Form["stringListaVideos"];
                        string[] arrayVideos = stringVideos.Split(';');


                        for (int i = 0; i < arrayVideos.Length; i++)
                        {
                            var novoVideo = new Video();
                            string url = arrayVideos[i];
                            if (linkVideoValido(url) == true)
                            {
                                novoVideo.Url = url;
                                novoVideo.NoticiaId = idNoticia;
                                Guid idVideo = videoAdd.create(novoVideo);
                                videoAdd.Save();
                            }
                        }

                        var stringMarcos = Request.Form["stringComMarcos"];
                        string[] arrayMarcos = stringMarcos.Split('§');
                        IDataCRUD<Mapa> mapaAdd = new DataCRUD<Mapa>();
                        for (int i = 0; (i + 4) < arrayMarcos.Length; i += 4)
                        {
                            // Falta resolver o problema do parse, ele nao ta a parsar bem o decimal!
                            //arrayMarcos[i] = arrayMarcos[i].Replace('.', ',');
                            //arrayMarcos[i + 1] = arrayMarcos[i + 1].Replace('.', ',');
                            double latitude = double.Parse(arrayMarcos[i], NumberStyles.Any);
                            double longitude = double.Parse(arrayMarcos[i + 1], NumberStyles.Any);
                            string titulo = arrayMarcos[i + 2];
                            string corpo = arrayMarcos[i + 3];
                            Mapa novoMapa = new Mapa();
                            novoMapa.Latitude = (float)latitude;
                            novoMapa.Longitude = (float)longitude;
                            novoMapa.Morada = titulo + "§" + corpo;
                            novoMapa.NoticiaId = idNoticia;
                            mapaAdd.create(novoMapa);
                            mapaAdd.Save();
                        }

                        IDataCRUD<Imagem> imagemAdd = new DataCRUD<Imagem>();


                        var teste = Request.Files;

                        foreach (string file in Request.Files)
                        {

                            HttpPostedFileBase hpf = Request.Files[file] as HttpPostedFileBase;
                            var fileSize = hpf.ContentLength;
                            if (fileSize == 0)
                                continue;

                            Imagem novaImagem = new Imagem();
                            if (Path.GetExtension(hpf.FileName).Length == 0)
                            {
                                throw new Exception(string.Format("File '{0}' has no extension (e.g. .jpeg .png)", hpf.FileName));
                            }
                            byte[] buffer = new byte[fileSize];
                            hpf.InputStream.Read(buffer, 0, fileSize);
                            novaImagem.Tipo = Path.GetExtension(hpf.FileName);
                            novaImagem.ImageFile = buffer;
                            novaImagem.NoticiaId = idNoticia;
                            novaImagem.Nome = hpf.FileName;
                            Guid idImagem = imagemAdd.create(novaImagem);
                            imagemAdd.Save();
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


        public ActionResult ReportNoticia(string id)
        {
            Guid gid = new Guid(id);
            var noticia = repNoticias.fetchAll().Single(n => n.NoticiaId == gid);

            noticia.flagNoticia();
            repNoticias.update(noticia);
            repNoticias.Save();
            var model = buildModel(id);
            return View("Show", model);
            
        }
    }
}
