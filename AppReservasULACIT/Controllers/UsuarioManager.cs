using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AppReservasULACIT.Models;
using System.Threading.Tasks;
using System.Net.Http;
using Newtonsoft.Json;
using System.Text;

namespace AppReservasULACIT.Controllers
{
    public class UsuarioManager
    {
        string UrlAuthenticate = "http://localhost:49220/api/login/authenticate/";
        string UrlRegistrar = "http://localhost:49220/api/login/register/";

       public async Task<Usuario> Validar(string username, string password)
        {
            LoginRequest loginRequest = new LoginRequest() { Username = username, Password = password };

            HttpClient httpClient = new HttpClient();

            var response = await httpClient.PostAsync(UrlAuthenticate,
                new StringContent(JsonConvert.SerializeObject(loginRequest), Encoding.UTF8, "application/json"));

            return JsonConvert.DeserializeObject<Usuario>(await response.Content.ReadAsStringAsync());
        }
    }
}