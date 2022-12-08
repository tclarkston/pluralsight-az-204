using System;
using System.Threading.Tasks;
using Microsoft.Identity.Client;

namespace az204_auth
{
    class Program
    {
        private const string _clientId = "3fe3853c-8b8f-4dd1-bfe5-815665c896db";
        private const string _tenantId = "d470d72b-2662-48c7-873d-3dcfcb3e2683";

        public static async Task Main(string[] args)
        {
            var app = PublicClientApplicationBuilder
                .Create(_clientId)
                .WithAuthority(AzureCloudInstance.AzurePublic, _tenantId)
                .WithRedirectUri("http://localhost")
                .Build();

            string[] scopes = { "user.read" };
            AuthenticationResult result = await app.AcquireTokenInteractive(scopes).ExecuteAsync();
            
            Console.WriteLine($"Token:\t{result.AccessToken}");
        }
    }
}
