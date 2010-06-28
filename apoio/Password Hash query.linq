<Query Kind="Statements">
  <Connection>
    <ID>c9e155da-d977-4118-8641-8d90a9a6559b</ID>
    <Persist>true</Persist>
    <Server>.\SQLEXPRESS</Server>
    <Database>newzic</Database>
  </Connection>
</Query>

foreach(var j in Jornalistas)
{
	var sha = System.Security.Cryptography.SHA1.Create();
	j.Password = Convert.ToBase64String(sha.ComputeHash(System.Text.Encoding.UTF8.GetBytes(j.Password)));
}

SubmitChanges();